/**
*   マイルストーンのプロジェクトの共有するユーザを設定するTriggerHandlerである
*
*   作成日　：　2013.12.5 Kim
*   修正履歴　：
*/

public class Milestone_Permission_Trigger_Handler {
    public static void isCheckUserPM(List<Milestone_Permission__c> nList){
        Milestone_Permission__c chkObj = nList.get(0);
        System.debug('**************** isBefore : ' + UserInfo.getUserId() + ' *********' + UserInfo.getName());
        if(chkObj != null){
            //PMの場合
            Integer mpSize = [SELECT count() FROM Milestone_Permission__c 
                                                WHERE Project__c =:chkObj.Project__c 
                                                AND UserName__c = :UserInfo.getUserId()
                                                AND ProjectRole__c = :system.Label.Custom_Milestone_Role_PM];
                                                
                                              system.debug('●mpSize●:' + mpSize);
            //所有者リスト
            //Integer ownerSize = [SELECT count() FROM Milestone1_Project__c WHERE Id = :chkObj.Project__c AND OwnerId = :UserInfo.getUserId()];
            //システム管理者
            Integer adminSize = [SELECT count() FROM Profile WHERE Id = :UserInfo.getProfileId() AND (Name = 'システム管理者' OR Name = 'System Administrator')];
            
            system.debug('●adminSize●:' + adminSize);
            
            //新規
            Integer newProjectCnt = [SELECT count() FROM Milestone_Permission__c WHERE Project__c =:chkObj.Project__c ];
            
            //if(mpSize == 0 && ownerSize == 0 && adminSize == 0 && newProjectCnt != 0){
            if(mpSize == 0 && adminSize == 0 && newProjectCnt != 0){
                chkObj.addError(system.Label.Custom_Milestone_err_pm);
            }
        }
    }
    //Insert対象のHandler
    public static void insertMilestonePermission(List<Milestone_Permission__c> newList){
        List<Milestone1_Project__Share> insertProjectShareList = new List<Milestone1_Project__Share>();
        List<String> projectShareId = new List<String>();
        
        for(Milestone_Permission__c mp : newList){
            //マイルストーン権限のオブジェクトにレコード作成した場合、プロジェクトを共有する。
            Milestone1_Project__Share projectShare = new Milestone1_Project__Share();
            projectShare.ParentId       = mp.Project__c;
            projectShare.UserOrGroupId  = mp.UserName__c;
            projectShare.AccessLevel    = getTransAccessLevel(mp.ProjectRole__c);
            projectShareId.add(mp.Project__c);
            insertProjectShareList.add(projectShare);
        }
        
        system.debug('●insertProjectShareList●' + insertProjectShareList);
        
        //Milestoneの共有に挿入データ
        if(insertProjectShareList.size() > 0) {
            List<Milestone1_Milestone__Share> insertMilestoneShareList = new List<Milestone1_Milestone__Share>();
            for(Milestone1_Milestone__c m : [SELECT Id,Project__c, OwnerId FROM Milestone1_Milestone__c WHERE Project__c IN:projectShareId]){
                
                for(Milestone1_Project__Share p : insertProjectShareList){
                    if(m.project__c == p.ParentId){
                        if(m.OwnerId != p.UserOrGroupId){
                            Milestone1_Milestone__Share mShare = new Milestone1_Milestone__Share();
                            mShare.ParentId         = m.Id;
                            mShare.UserOrGroupId    = p.UserOrGroupId;
                            mShare.AccessLevel      = p.AccessLevel;
                            insertMilestoneShareList.add(mShare);
                        }
                    }
                }
            }
            
            system.debug('●insertProjectShareList●' + insertProjectShareList);
            system.debug('●insertMilestoneShareList●' + insertMilestoneShareList);
            
            insert insertProjectShareList;
            if(insertMilestoneShareList.size() > 0) insert insertMilestoneShareList;
        }
    }
    
    //Update対象のHandler
    public static void updateMilestonePermission(List<Milestone_Permission__c> oldList, List<Milestone_Permission__c> newList){
        
        Milestone_Permission_Trigger_Handler.deleteMilestonePermission(oldList);
        
        system.debug('●Update対象oldList●:' + oldList);
        
        Milestone_Permission_Trigger_Handler.insertMilestonePermission(newList);
        
        system.debug('●Update対象newList●:' + newList);
    }
    
    //delete対象のHandler
    public static void deleteMilestonePermission(List<Milestone_Permission__c> oldList){
        //プロジェクトから共有削除
        String objId = '';
        List<String> oldUsersKey = new List<String>();
        for(Milestone_Permission__c oldMp : oldList){
            objId = oldMp.Project__c;
            oldUsersKey.add(oldMp.UserName__c);
        }
        
        system.debug('●oldUsersKey●' + oldUsersKey);
        
        List<Milestone1_Project__Share> shareList = [SELECT Id, ParentId, UserOrGroupId, AccessLevel 
                                                    FROM Milestone1_Project__Share 
                                                    WHERE ParentId =: objId AND UserOrGroupId IN:oldUsersKey];
        if(shareList.size() > 0) delete shareList;
        Set<Id> milestoneShareId = new Set<Id>();
        for(Milestone1_Milestone__c m : [SELECT Id FROM Milestone1_Milestone__c WHERE Project__c =:objId]){
            milestoneShareId.add(m.Id);
        }
        List<Milestone1_Milestone__Share> mileShareList = [SELECT Id, ParentId, UserOrGroupId, AccessLevel 
                                                    FROM Milestone1_Milestone__Share 
                                                    WHERE ParentId IN :milestoneShareId AND UserOrGroupId IN:oldUsersKey AND AccessLevel !='All'];
        
        system.debug('●mileShareList●' + mileShareList);
        if(mileShareList.size() > 0) delete mileShareList;
    }
    
    /**
    *   ユーザから共有する画面で設定した値を基に共有オブジェクトに設定する設定値を変換
    *   @param : 権限名
    */
    private static String getTransAccessLevel(String param){
        String result = '';
        system.debug('●param値確認●:' + param);
        if(param == system.Label.Custom_Milestone_Role_Info){
            result = 'Read';
        } else if(param == system.Label.Custom_Milestone_Role_Staff || 
                    param == system.Label.Custom_Milestone_Role_PM){
            result = 'Edit';
        }
        return result;
    }
}