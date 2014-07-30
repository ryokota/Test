public with sharing class RM_VFC_Project_BICtrl {

	//URLパラメータ
	private String retUrl { get; set; }
	private Milestone1_Project__c project { get; set; }
	
	public ProjectTeamTableHelper projectTeams { get; set; }
	public MilestoneTableHelper milestones { get; set;}
	public pageRederedHelper pageRedered { get; set; }
	
	//ActionFunction Param
	public Integer projectTeamNo { get; set; }
	public Id projectTeamUserId { get; set; }
	public Integer milestoneNo { get; set; }
	
	public boolean isNew { get { 
		return this.project.Id == null ? false : true;
	} }

	public RM_VFC_Project_BICtrl(ApexPages.StandardController stdController) {
		
		this.project = (Milestone1_Project__c)stdController.getRecord();
		
		//URLパラメータ取得
		this.project.RecordTypeId = ApexPages.currentPage().getParameters().get('RecordType');
		this.retUrl = ApexPages.currentPage().getParameters().get('retURL');
		
		if (stdController.getId() == null) {
			
			//新規処理
			this.project.OwnerId = userInfo.getUserId();
			this.milestones = new MilestoneTableHelper();
			this.projectTeams = new projectTeamTableHelper();
			
			//セクション・項目 表示/非表示処理
			this.pageRedered = new pageRederedHelper(false, '');
			
		} else {
			
			//編集処理
			Milestone1_Project__c p = [select RecordTypeId, AllView__c from Milestone1_Project__c where Id = :this.project.id];
			this.project.RecordTypeId = p.RecordTypeId;
			this.pageRedered = new pageRederedHelper(p.AllView__c, this.project.RM_Approval_Status__c);
			this.pageRedered.setRendered();
			
			//従属オブジェクト取得
			this.projectTeams = new ProjectTeamTableHelper(getProjectTeams(this.project.id));
			this.milestones = new MilestoneTableHelper(getMilestions(this.project.id));
		}
		
		for (Integer i = this.projectTeams.maxNo; i < 5; i++) {
			this.projectTeams.add(new Milestone_Permission__c());
		}
		for (Integer i =this.milestones.maxNo; i< 5; i++) {
			this.milestones.add(new Milestone1_Milestone__c());
		}
	}
	
	/*
	 * 各オブジェクトを保存後にレコードタイプ選択画面へ遷移する
	 * return レコードタイプ選択画面
	*/
	public pageReference biSaveAndNew() {
		
		biSave();
		
		String projectPrefixId = Milestone1_Project__c.sObjectType.getDescribe().getKeyPrefix();
		
		pagereference pf = new pagereference('/setup/ui/recordtypeselect.jsp');
		pf.getParameters().put('ent', System.Label.Project_ID);
		pf.getParameters().put('retURL', '/' + this.project.Id);
		
		pagereference save_new_url = new pagereference('/' + projectPrefixId + '/e'  );
		save_new_url.getParameters().put('retURL', '/' + this.project.Id);
		pf.getParameters().put('save_new_url', save_new_url.getUrl());
		return PF;
		
	}
	
	/*
	 * 各オブジェクトを保存後に詳細画面へ遷移する
	 * Milestone_Permission__cに同一ユーザが存在した場合はエラーとする
	 * return 保存後の詳細画面
	*/
	public pageReference biSave() {
		
		Savepoint sp = Database.setSavepoint();
		
		try {
			
			//BI Project 保存
			this.project.AllView__c = this.pageRedered.isAllView;
			upsert this.project;
		
			//Project Team 保存
			set<Id> duplicateId = new set<Id>();
			List<Milestone_Permission__c> upsertProjectTeam = new List<Milestone_Permission__c>();
			for (ProjectTeamToNo pt : this.projectTeams.records) {
				if (pt.record.UserName__c != null) {
					
					//重複エラーチェック
					if (duplicateId.contains(pt.record.UserName__c)) {
						pt.record.UserName__c.addError(System.Label.RM_ProjectTeam_ErrMessage);
						return null;
					}
					duplicateId.add(pt.record.UserName__c);
					
					//編集不可項目のため新規時のみ設定
					if (pt.record.Id == null) {
						pt.record.Project__c = this.project.id;
					}
					
					upsertProjectTeam.add(pt.record);
				}
			}
			
			if (!upsertProjectTeam.isEmpty()) {
				upsert upsertProjectTeam;
			}
			
			//Milestone 保存
			List<Milestone1_Milestone__c> upsertMilestone = new List<Milestone1_Milestone__c>();
			for (MilestoneToNo m : this.milestones.records) {
				if (m.record.Name != null) {
					
					//編集不可項目のため新規時のみ設定
					if (m.record.Id == null) {
						m.record.Project__c = this.project.id;
					}
					upsertMilestone.add(m.record);
				}
			}
			if (!upsertMilestone.isEmpty()) {
				upsert upsertMilestone;
			}
			
			return new pageReference('/' + this.project.Id);
			
		} catch (Exception ex) {
			
			Database.rollback(sp);
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR , ex.getMessage()));
			return null;
		}
	}
	
	/*
	 * allViewがtrueの場合は画面のセクション・項目をすべて表示する
	*/
	public void allViewChange() {
		
		this.pageRedered.setRendered();
	}
	
	/*
	 * プロジェクトチームのテーブルに1行追加する
	*/
	public void addRowsByProjectTeam() {
		
		this.projectTeams.add(new Milestone_Permission__c(ProjectRole__c=Label.Custom_Milestone_Role_PM));
		
	}
	
	/*
	 * マイルストーンのテーブルに1行追加する
	*/
	public void addRowsByMilestoneTeam() {
		
		this.milestones.add(new Milestone1_Milestone__c());
		
	}
	
	/*
	 * 選択されたユーザのFunction、SubFunctionを設定する
	 * 選択されたユーザがすでに設定されていた場合はエラーを表示する
	*/
	public void setTeamFunction() {
		
		system.debug(this.projectTeamNo + '/' + this.projectTeamUserId);
		
		//ユーザ重複チェック		
		if (this.projectTeams.hasRecordByUserId(this.projectTeamNo, this.projectTeamUserId)) {
			this.projectTeams.addError(this.projectTeamNo, System.Label.RM_ProjectTeam_ErrMessage);
			return;
		}
		
		//ユーザ存在チェック
		List<User> u = [select Id, L2_Function_E__c, L3_Function_E__c from User where Id = :this.projectTeamUserId];
		if (u.isEmpty()) {
			return;
		}
		
		//ユーザ情報設定
		this.projectTeams.setFunction(this.projectTeamNo, u.get(0));
	}
	
	/*
	 * 編集権限チェック
	*/
	private boolean hasEditPermission(Id uid, Id pid) {
		
		Profile p = [select Name from Profile where ID = :UserInfo.getProfileId()];
		if (p.Name == 'システム管理者' || p.Name == 'RFA - System Administrator') {
			return true;
		}
		
		if (pid == null) {
			return true;
		}
		
		List<Milestone_Permission__c> edit = [select
													Id
												from
													Milestone_Permission__c
												where
													UserName__c	= :uid and
													Project__c	= :pid and
													ProjectRole__c in (:Label.Custom_Milestone_Role_PM,
																		:Label.Custom_Milestone_Role_Staff)];
		
		return !edit.isEmpty();
	}
	
	
	/*
	 * 選択されたマイルストーンを削除する
	*/
	public void deleteMilestone() {
		
		try {
		
			this.milestones.deleteRecord(this.milestoneNo);
		
		} catch (Exception ex) {
			
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR , ex.getMessage()));
		}
	}
	
	/*
	 * マイルストーンのみを保存する
	*/
	public void saveMilestone() {
		
			PageReference pf = biSave();
			
			if (pf != null) {
				
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO , '保存が完了しました。'));
			}
	}
	
	/*
	 * 新規：取得したレコードタイプがBIの場合はVF画面を表示。BI以外の場合は標準画面へ遷移する
	 * 編集：取得したレコードのレコードタイプがBIの場合はVF画面を表示。BI以外の場合は標準画面へ遷移する
	*/
	public PageReference biCheck() {
		
		PageReference ref;
		
		//レコードタイプがBIの場合はVF画面を使用する
		if ( isBI(this.project.recordTypeid) &&
			hasEditPermission(UserInfo.getUserId(), this.project.id)) {
			return null;
		}
		
		//標準新規
		String url;
		String projectPrefixId = Milestone1_Project__c.sObjectType.getDescribe().getKeyPrefix();
		
		//標準編集
		if (this.project.Id == null) {
			url = '/' + projectPrefixId +'/e';
		} else {
			url = '/' + this.project.Id +'/e';
		}
		
		ref = new PageReference(url);
		ref.getParameters().put('nooverride', '1');
		
		ref.getParameters().put('RecordType', this.project.recordTypeid);
		ref.getParameters().put('retURL',     this.retUrl);
		
		ref.setRedirect(true);
		return ref;
	}
	
	/*
	 * レコードタイプIDがBIか判定をする
	 * 判定はレコードタイプのDeveloperNameを使用する
	 * param レコードタイプID
	 * return true:BI false:BI以外
	*/
	private boolean isBI(id rid) {
		
		if (rid == null) {
			return false;
		}
		
		//DeveloperaNameを取得
		RecordType r = [select Id, DeveloperName from RecordType where id = :rid];
		String developerName = r.DeveloperName;

		if (developerName == Milestone1_Constants.RECORDTYPE_PROJECT_BI) {
				return true;
		}
		
		return false;
	}
	
	/*
	 * プロジェクトチームを取得する
	 * param Milestone1_Project__c.Id
	 * return List<Milestone_Permission__c>
	*/
	private List<Milestone_Permission__c> getProjectTeams(Id pid) {
		
		return [select
						Id,
						UserName__c,
						RM_Function__c,
						RM_Sub_Function__c,
						RM_Expected_Roles__c,
						ProjectRole__c
					from
						Milestone_Permission__c
					where
						Project__c = :pid
					order by
						Id asc];
		
	}
	
	/*
	 * マイルストーンを取得する
	 * param Milestone1_Project__c.Id
	 * return List<Milestone1_Milestone__c>
	*/
	private List<Milestone1_Milestone__c> getMilestions(Id pid) {
		
		return [select
						Id,
						Name,
						RM_Function__c,
						Kickoff__c,
						Deadline__c,
						Parent_Milestone__c
					from
						Milestone1_Milestone__c
					where
						Project__c = :pid
					order by
						Name asc];
	}
	
	/*
	 * 画面のセクション・項目の表示/非表示を制御するクラス
	*/
	public class pageRederedHelper {
		
		public String approvalStep { get; set; }
		public boolean isAllView { get; set; }
		public boolean isInitiateApproved { get; set; }
		
		public boolean viewSupportFunction { get; set; }
		public boolean viewProjectTeam { get; set; }
		public boolean viewDetailsOfSolution { get; set; }
		public boolean viewCostBenefit { get; set; }
		public boolean viewMilestone { get; set; }
		public boolean viewCommunication { get; set; }
		public boolean viewSCM { get; set; }
		public boolean viewProcurement { get; set; }
		public boolean viewProjectStatus { get; set; }
		public boolean viewDelays { get; set; }
		public boolean viewProjectDiscussion { get; set; }
		public boolean viewTakingOver { get; set; }
		public boolean viewActualFinishDate { get; set; }
		public boolean viewFinancialValidation { get; set; }
		public boolean viewLesonForFutureProjects { get; set; }
		
		/*
		 * コンストラクタ
		 * allViewと承認の状態を初期設定、セクション、項目の表示/非表示設定をする
		 * param isAllView true/全表示 false/stepに依存
		 * param step 承認の状態 Approval Step
		*/
		public pageRederedHelper(boolean isAllView, String step) {
			this.approvalStep		= step;
			this.isAllView			= isAllView;
			setRendered(this.isAllView, this.approvalStep);
		}
		
		/*
		 * 画面のセクション・項目をすべて表示を切り替える
		*/
		public void setRendered() {
			
			setRendered(this.isAllView, this.approvalStep);
		}
		
		/*
		 * 画面のセクション・項目をすべて表示を切り替える
		 * isAllViewはstepより優先される
		 * param isAllView true/全表示 false/stepに依存
		 * param step 承認の状態 Approval Step
		*/
		public void setRendered(boolean isAllView, String approvalStatus) {
			
			this.isAllView = isAllView;
				
			if (this.isAllView) {
				
				this.isAllView = true;
				this.isInitiateApproved			= true;
				this.viewSupportFunction		= true;
				this.viewProjectTeam			= true;
				this.viewDetailsOfSolution		= true;
				this.viewCostBenefit			= true;
				this.viewMilestone				= true;
				this.viewCommunication			= true;
				this.viewSCM					= true;
				this.viewProcurement			= true;
				this.viewProjectStatus			= true;
				this.viewDelays					= true;
				this.viewProjectDiscussion		= true;
				this.viewTakingOver				= true;
				this.viewActualFinishDate		= true;
				this.viewFinancialValidation	= true;
				this.viewLesonForFutureProjects = true;
				return;
			}
			
			if (approvalStatus == null || approvalStatus == '') {
				
				this.isInitiateApproved			= false;
				this.viewSupportFunction		= true;
				this.viewProjectTeam			= true;
				this.viewDetailsOfSolution		= false;
				this.viewCostBenefit			= false;
				this.viewMilestone				= false;
				this.viewCommunication			= false;
				this.viewSCM					= false;
				this.viewProcurement			= false;
				this.viewProjectStatus			= false;
				this.viewDelays					= false;
				this.viewProjectDiscussion		= false;
				this.viewTakingOver				= false;
				this.viewActualFinishDate		= false;
				this.viewFinancialValidation	= false;
				this.viewLesonForFutureProjects = false;
				return;
				
			}
			
			if (approvalStatus == RFA_Utility_Constants.ApprovalSetp_InitiateApproved) {
				
				this.isInitiateApproved			= true;
				this.viewSupportFunction		= true;
				this.viewProjectTeam			= true;
				this.viewDetailsOfSolution		= true;
				this.viewCostBenefit			= true;
				this.viewMilestone				= true;
				this.viewCommunication			= true;
				this.viewSCM					= true;
				this.viewProcurement			= true;
				this.viewProjectStatus			= false;
				this.viewDelays					= false;
				this.viewProjectDiscussion		= false;
				this.viewTakingOver				= false;
				this.viewActualFinishDate		= false;
				this.viewFinancialValidation	= false;
				this.viewLesonForFutureProjects = false;
				return;
				
			}
			
			if (approvalStatus == RFA_Utility_Constants.ApprovalSetp_CharterApproved ||
				approvalStatus == RFA_Utility_Constants.ApprovalSetp_CloseOutApproved) {
				
				this.isInitiateApproved			= true;
				this.viewSupportFunction		= true;
				this.viewProjectTeam			= true;
				this.viewDetailsOfSolution		= true;
				this.viewCostBenefit			= true;
				this.viewMilestone				= true;
				this.viewCommunication			= true;
				this.viewSCM					= true;
				this.viewProcurement			= true;
				this.viewProjectStatus			= true;
				this.viewDelays					= true;
				this.viewProjectDiscussion		= true;
				this.viewTakingOver				= true;
				this.viewActualFinishDate		= true;
				this.viewFinancialValidation	= true;
				this.viewLesonForFutureProjects = true;
				return;
				
			}
		}
	}
	
	/*
	 * プロジェクトチーム 行番号とユーザ.Function、SubFunction情報を保持
	*/
	public class projectTeamToNo {
		
		public Integer no { get; set; }
		public Milestone_Permission__c record { get; set; }
		public String function { get; set; }
		public String subFunction { get; set; }
		
		/*
		 * コンストラクタ
		 * param i 行番号
		 * param r プロジェクトチーム
		*/
		public projectTeamToNo(Integer i, Milestone_Permission__c r) {
			
			this.no = i;
			this.record = r;
			this.function = r.RM_Function__c;
			this.subFunction = r.RM_Sub_Function__c;
		}
		
		/*
		 * ユーザのFunction情報を設定する
		*/
		public void setFunction(User u) {
			
			this.record.UserName__c = u.Id;
			this.function = u.L2_Function_E__c;
			this.subFunction = u.L3_Function_E__c;
			
		}
	}
	
	/*
	 * プロジェクトチームをテーブル表示するヘルパークラス
	*/
	public class projectTeamTableHelper {
		
		public List<projectTeamToNo> records { get; set; }
		public Integer maxNo {
			get { 
				if (this.records.isEmpty()) {
					return 0;
				} else {
					return this.records.size();
				}
			}
		}
		
		/*
		 * コンストラクタ
		 * レコードの初期化
		*/
		public projectTeamTableHelper() {
			this.records = new List<projectTeamToNo>();
		}
		
		/*
		 * コンストラクタ
		 * ptのレコードリストを初期値に設定する
		 * param pt プロジェクトチームのレコードリスト
		*/
		public projectTeamTableHelper(List<Milestone_Permission__c> pt) {
			
			this.records = new List<projectTeamToNo>();
			for (Integer i = 1; i <= pt.size(); i++) {
				this.records.add(new projectTeamToNo(i, pt.get(i - 1)));
			}
		}
		
		/*
		 * 指定されたUser.IDが他に存在するか確認をする
		 * param no 行番号 自分自身か判定に使用
		 * param uId User.Id
		*/
		public boolean hasRecordByUserId(Integer no, Id uId) {
			
			for (projectTeamToNo r : this.records) {
				
				if (r.no != no &&
					r.record.UserName__c != null && r.record.UserName__c == uId) {
						system.debug(r.no + '/' + r.record.UserName__c + '/' + uId);
						return true;
				}
			}
			return false;
		}
		
		/*
		 * 指定された行のUserNameにエラーメッセージを設定する
		 * param no 行番号
		 * param msg エラーメッセージ
		*/
		public void addError(Integer no, String msg) {
			
			projectTeamToNo pt = this.records.get(no -1);
			pt.record.UserName__c.addError(msg);
		}
		
		/*
		 * 指定された行のプロジェクトチームにFunction情報を設定する
		 * param no 行番号
		 * param u User(L2 Function, L3 Functionを取得済みであること)
		*/
		public void setFunction(Integer no, User u) {
			
			projectTeamToNo pt = this.records.get(no -1);
			pt.setFunction(u);
		}
		
		/*
		 * プロジェクトチームリストに行番号とレコードをaddする
		 * param pt プロジェクトチーム
		*/
		public void add(Milestone_Permission__c pt) {
			
			this.records.add(new projectTeamToNo(this.maxNo + 1,	 pt));
		}
	}
	
	/*
	 * マイルストーンと行番号を保持するクラス
	*/
	public class MilestoneToNo {
		
		public Integer no { get; set; }
		public Milestone1_Milestone__c record { get; set; }
		
		/*
		 * コンストラクタ
		 * 行番号とマイルストーンを設定する
		 * param i 行番号
		 * param r マイルストーン
		*/
		public MilestoneToNo(Integer i, Milestone1_Milestone__c r) {
			
			this.no = i;
			this.record = r;
		}
		
		/*
		 * 保持しているマイルストーンを削除する(DBから削除する)
		 * 未登録の場合は値を初期化する
		*/
		public void deleteRecord() {
			
			if (this.record.id != null) {
				delete this.record;
			}
			this.record = new Milestone1_Milestone__c();
		}
	}
	
	/*
	 * マイルストーンをテーブル表示するヘルパークラス
	*/
	public class MilestoneTableHelper {
		
		public List<MilestoneToNo> records { get; set; }
		public Integer maxNo {
			get { 
				if (this.records.isEmpty()) {
					return 0;
				} else {
					return this.records.size();
				}
			}
		}
		
		/*
		 * コンストラクタ
		 * レコードの初期化
		*/
		public MilestoneTableHelper() {
			this.records = new List<MilestoneToNo>();
		}
		
		/*
		 * コンストラクタ
		 * mのレコードリストを初期値に設定する
		 * param m マイルストーンのレコードリスト
		*/
		public MilestoneTableHelper(List<Milestone1_Milestone__c> m) {
			
			this.records = new List<MilestoneToNo>();
			for (Integer i = 1; i <= m.size(); i++) {
				this.records.add(new MilestoneToNo(i, m.get(i - 1)));
			}
		}
		
		/*
		 * 指定されたnoのレコードをdeleteする
		 * オブジェクトに未登録の場合は値をクリアするのみ
		 * 行数が５件以上の場合はno行目のリストをremoveする
		*/
		public void deleteRecord(Integer no) {
			
			for (MilestoneToNo r : this.records) {
				
				if (r.no == no) {
					
					r.deleteRecord();
					
					if (this.records.size() > 5) {
						this.records.remove(no - 1);
						reNumbering();
					}
					return;
				}
			}
		}
		
		/*
		 * マイルストーンの保存
		*/
		public void save() {
			
			save(null);
		}
		/*
		 * マイルストーンの保存
		*/
		public void save(Id pid) {
			
			List<Milestone1_Milestone__c> saveRecords = new List<Milestone1_Milestone__c>();
			
			for (MilestoneToNo r : this.records) {
				
				if (r.record.Name != null) {
					
					if (pid != null) {
						r.record.Project__c = pid;
					}
					saveRecords.add(r.record);
				}
			}
			
			if (!saveRecords.isEmpty()) {
				upsert saveRecords;
			}
		}
		
		/*
		 * プロジェクトチームリストに行番号とレコードをaddする
		 * param m マイルストーン
		*/
		public void add(Milestone1_Milestone__c m) {
			
			this.records.add(new MilestoneToNo(this.maxNo + 1,	 m));
			
		}
		
		/*
		 * 行番号を採番し直す
		*/
		private void reNumbering() {
			
			for (Integer i = 1; i <= this.records.size(); i++) {
				this.records.get(i - 1).no = i;
			}
		}
	}
}