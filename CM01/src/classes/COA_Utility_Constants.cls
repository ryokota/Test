public with sharing class COA_Utility_Constants {
	
	
	/*
		Matrix
	*/
	
	
	/*
		COA Appendix Ⅲ. 
	*/	
		
	/*
		COA Appendix Ⅲ.  B. 1. - 8.
		COA Appendix Ⅲ.  C.
	*/
	
	public static final Set<String> setPrimarySubCategoryB1ToB7 = new Set<String>{
		'1. Approval of Field Sales Operation and VM Customer Agreement',
		'2. Approval of Customer Agreement for CS KAM',
		'3. Approval of Customer Agreement for Food KAM',
		'4. Approval of Customer Agreement for SAKAYA KAM',
		'5. Approval of Customer Agreement for VM Corporate Sales&Hunter',
		'6. Approval of Customer Agreement for Corporate KAM',
		'7. Approval of Customer Agreement for FV - VM',
		'7. Approval of Customer Agreement for FV - OCS, Shop Caffe',
		'7. Approval of Customer Agreement for FV - Corporate Sales'
	};
	
	public static final Set<String> setPrimarySubCategoryOthers = new Set<String>{
		'Z. Other'
	};	

	//public static final Set<String> setPrimarySubCategoryB8 = new Set<String>{
	//};	
	
	
	public static final List<String> listSubCategories = new List<String>{
		'01. Contract unit price',
		'02. Special price / Promotion discount',
		'03. FS selling price',
		'04. FS commission (Variable)',
		'05. FS commission (Fixed)',
		'06. Key money / Rebate / Spot / Other',
		'07. Only in the case of Rebate',
		'08. Other support',
		'09. Promotion / Other expense',
		'10. Promotion (Cooperation / Sampling)'
	};
	
	/*
		COA Appendix Ⅲ. B. 1.
	*/	
	public static final Map<String, List<String>> mapAppendix3B1_LevelToAcronym = new Map<String, List<String>>{
		'L10' => new String[]{'BCFSR', 'BCAFSR', 'BCVMTR', 'BCVMKR', 'BCVMSR', 'BCVMCR', 'BCVMTokR'}, 
		'L9'  => new String[]{'BCFS'}, 
		'L8'  => new String[]{'TBCFS'}, 
		'L7'  => new String[]{'BCRGM'}, 
		'L6'  => new String[]{'BFCF'}, 
		'L5'  => new String[]{'TBCFSO', 'TBCVM'}, 
		'L4'  => new String[]{'CCO'},
		'L3'  => new String[]{'CLO'}, 
		'L2'  => new String[]{'CFO'},
		'L1'  => new String[]{'CEO'}
	}; 	

	/*
		COA Appendix Ⅲ. B. 2.
	*/
	public static final Map<String, Integer> mapCOAAppendix3B2_ApproverToLevel = new Map<String, Integer>{
		'KFKAMS' => 1, 
		'KCSKAM' => 2,
		'BCRGM' => 3, 
		'BCCS' => 4, 
		'BFCF' => 5, 
		'TBCCS' => 6, 
		'TBCM&CL' => 7, 
		'TBCKAM' => 8, 
		'CCO' => 9,
		'CLO' => 10, 
		'CFO' => 11,
		'CEO' => 12
	}; 
	
	public static final Map<String, String> mapAppendix3B2_LevelToAcronym = new Map<String, String>{
		'L12' => 'KFKAMS', 
		'L11' => 'KCSKAM',
		'L10' => 'BCRGM', 
		'L9'  => 'BCCS', 
		'L8'  => 'BFCF', 
		'L7'  => 'TBCCS', 
		'L6'  => 'TBCM&CL', 
		'L5'  => 'TBCKAM', 
		'L4'  => 'CCO',
		'L3'  => 'CLO', 
		'L2'  => 'CFO',
		'L1'  => 'CEO'
	}; 	

	/*
		COA Appendix Ⅲ. C.
	*/
	public static final Set<String> setAcronymToMapingToL3 = new Set<String>{
		'TBCFSO',
		'TBCVM'
	};	
	public static final Set<String> setAcronymToMapingToL4 = new Set<String>{
		'TBCFSM1',
		'TBCFSM2',
		'TBCFSM3',
		'TBCFSM4'	
	};
	public static final Set<String> setAcronymToMapingToL5 = new Set<String>{
		'BCCS',
		'BCFDKAM'
	};
	public static final Set<String> setAcronymToMapingToL6 = new Set<String>{
		'BCFSR',
		'BCAFSR',
		'BCVMTR',
		'BCVMKR',
		'BCVMSR',
		'BCVMCR',
		'BCVMTokR',
		'KCSKAM',
		'KCFDKAM'
	};		
	public static final Set<String> setAcronymToMapingToL7 = new Set<String>{

	};
}