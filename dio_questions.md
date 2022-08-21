1. How dio upload file to server?
 It upload file in data part with post request.


2. What is the FormData?
 It is formate for file upload.

3. How we create FormData as Map instance?

   FormData formData = FormData.fromMap(

    {

   file: await MultipartFile.fromFile(file.path,name: x.png);

    }
   );


4. Send image (FormData) to server?

     dio.post( end_point_url, data: formData);
