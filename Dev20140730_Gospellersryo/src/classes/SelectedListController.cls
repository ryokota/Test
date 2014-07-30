public with sharing class SelectedListController {

    public String chkList { get; set; }

    public Set<string> chkSet{get;set;}
    public boolean chk{get;set;}
    
    //コンストラクタ
    public SelectedListController(){
        chkSet = new Set<string>();
        Integer i;
        for(i = 0; i <= 10;i++){
            //chkSet.add(i);
            if(math.mod(i, 2)==0){
                chkSet.add('true'+i);
                chk=true;
            }else{
                chkSet.add('false'+i);
                //chk=false;
            }
        }
    }

}