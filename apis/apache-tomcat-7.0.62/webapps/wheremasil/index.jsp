<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>JavaScript | split</title>
  </head>
  <body>
    <h1>Split Method 1</h1>
    <p>abc,def,ghi</p>
    <script>
      var jbString = 'fordivil,com';
      var jbSplit = jbString.split( ',' );
      for ( var i in jbSplit ) {
        document.write( '<p>' + jbSplit[i] + '</p>' );
      }
    </script>
  </body>
</html>