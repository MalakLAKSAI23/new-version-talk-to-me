

class product {

   String title="";
   String image="";
   double prix=0;
   bool isFree = false;
   String description="";

   product(String title,String image,double prix,bool isFree,String description){
        title=title;
        image=image;
        prix=prix;
        isFree=isFree;
        description=description;
   }

   String getTitle(){
    return title;
   }
   String getimage(){
    return image;
   }

   double getPrix(){
    return prix;
   }
   bool getIsFree(){
    return isFree;
   }
   String getDescription(){
    return description;
   }

   @override
    String toString(){
    return "$title $image $prix  $description";
   }
}