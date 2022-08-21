1. How can we send file to sever in multipart :-

Step 1:- Create http.MultipartRequest -> Instance object.
Step 2:- Create http.MultppartFile -> instance object
Step 3 :- Add multipart_file instance to multipart_request instance.
Setp 4:- send async request call


2. How can we create MultipartRequest instance.

   var multipart_request = http.MultipartRequest('Post',Uri.parse('your_base_url'));



3. How can we create MultipartFile instance.

 There are three way to create MultipartFile instance.
   
    A. MultipartFile() :- constructor -> It is work for Byte Stream
    B. MultipartFile.fromBytes() :- It is work for List of Bytes
    C. MultipartFile.fromPath() :- It is work for filePath known


    


