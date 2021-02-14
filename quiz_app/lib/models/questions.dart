class Questions{
  int id;
  String quest;
  String A;
  String B;
  String C;
  String D;
  String T;


  //guncellemelerde id verilebilir
  //ekleme operasyonlarında id verilmez,genelde veritabanında kendisi oluşturur

  //guncelleme için bu conscructor ı kullanacaz
  Questions.withId(int id,String quest, String A, String B, String C, String D,String T){
    this.id=id;
    this.quest=quest;
    this.A=A;
    this.B=B;
    this.C=C;
    this.D=D;
    this.T=T;
  }

  //ekleme yaparken bunu kullanacaz
  Questions(String quest, String A, String B, String C, String D,String T){
    this.quest=quest;
    this.A=A;
    this.B=B;
    this.C=C;
    this.D=D;
    this.T=T;
  }

  Questions.withoutInfo(){
  }


}