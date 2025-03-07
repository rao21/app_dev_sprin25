class Character {
     final String name;
     final String imageUrl;
     final String affiliation;
     final PhysicalDescription physicalDescription;

     Character({required this.name, 
     required this.imageUrl, 
     required this.affiliation,required this.physicalDescription});

     factory Character.fromJson(Map<String, dynamic> json) {
       return Character(
         name: json['name'] ?? 'No Name',
         imageUrl: json['image'] ?? '',
         affiliation: json['affiliation'] ?? 'Unknown',
         physicalDescription: PhysicalDescription.fromJson(json['physicalDescription'])
       );
     }
   }
  class PhysicalDescription {
     final String gender;
     final String eyeColor;
     final String hairColor;

     PhysicalDescription({required this.gender, 
     required this.eyeColor, 
     required this.hairColor});

     factory PhysicalDescription.fromJson(Map<String, dynamic> json) {
       return PhysicalDescription(
         eyeColor: json['eyeColor'] ?? 'No Name',
         gender: json['gender'] ?? '',
         hairColor: json['hairColor'] ?? 'Unknown',
       );
     }
   }