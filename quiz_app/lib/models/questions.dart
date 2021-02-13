class Questions{
  int id;
  String quest;
  String A;
  String B;
  String C;
  String D;
  String T;
  //String imgAdres = "https://cdn.pixabay.com/photo/2014/07/10/11/17/grimace-388987_1280.jpg";

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
   // this.imgAdres=imgAdres;

  }

  //ekleme yaparken bunu kullanacaz
  Questions(String quest, String A, String B, String C, String D,String T){
    this.quest=quest;
    this.A=A;
    this.B=B;
    this.C=C;
    this.D=D;
    this.T=T;
   // this.imgAdres=imgAdres;

  }

  Questions.withoutInfo(){

  }


}