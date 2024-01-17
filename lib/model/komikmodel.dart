class KomikModel{
  final String judul;
  final String url;
  final List<Map<String, dynamic>> eps;
  bool isFavorite;

  KomikModel({
    required this.judul,
    required this.url,
    required this.eps,
    this.isFavorite = false
  });

}

List<KomikModel> listModel = [
  KomikModel(
      judul: "Lookism",
      url: "https://cdn.wallpapersafari.com/4/82/Or2EAL.jpg",
      eps: [{
        "id": "1",
        "title": "Prolog",
      },{
        "id" : "2",
        "title": "Introduction"
      }]
  ),
  KomikModel(
      judul: "Naruto",
      url: "https://th.bing.com/th/id/R.ae4787f8dd5e3e02efcd29b27d170cac?rik=NdF7lHerzPNMMA&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fwc1705192.jpg&ehk=6WMh5%2fmZNizgDg7XG8qON%2bH9YJURJ6sA5G08r5docfk%3d&risl=&pid=ImgRaw&r=0",
      eps: [{
        "id": "1",
        "title": "Fighting",
      },{
        "id" : "2",
        "title": "Istirahat"
      }]
  ),
  KomikModel(
      judul: "Noblesse",
      url: "https://mcdn.wallpapersafari.com/medium/27/58/0WVrkh.jpg",
      eps: [{
        "id": "1",
        "title": "Who he is?",
      },{
        "id" : "2",
        "title": "Almighty"
      }]
  ),

];