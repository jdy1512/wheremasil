<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head><style type="text/css">

div {
   opacity: 0.7;
   font: 12px Arial;
}

span.bold { font-weight: bold; }

#normdiv {
   z-index: 8;
   height: 70px;
   border: 1px dashed #999966;
   background-color: #ffffcc;
   margin: 0px 50px 0px 50px;
   text-align: center;
}

#reldiv1 {
   z-index: 3;
   height: 100px;
   position: relative;
   top: 30px;
   border: 1px dashed #669966;
   background-color: #ccffcc;
   margin: 0px 50px 0px 50px;
   text-align: center;
}

#reldiv2 {
   z-index: 2;
   height: 100px;
   position: relative;
   top: 15px;
   left: 20px;
   border: 1px dashed #669966;
   background-color: #ccffcc;
   margin: 0px 50px 0px 50px;
   text-align: center;
}

#absdiv1 {
   z-index: 5;
   position: absolute;
   width: 150px;
   height: 350px;
   top: 10px;
   left: 10px;
   border: 1px dashed #990000;
   background-color: #ffdddd;
   text-align: center;
}

#absdiv2 {
   z-index: 1;
   position: absolute;
   width: 150px;
   height: 350px;
   top: 10px;
   right: 10px;
   border: 1px dashed #990000;
   background-color: #ffdddd;
   text-align: center;
}

</style></head>

<body>

<br /><br />

<div id="absdiv1">
   <br /><span class="bold">DIV #1</span>
   <br />position: absolute;
   <br />z-index: 5;
</div>

<div id="reldiv1">
   <br /><span class="bold">DIV #2</span>
   <br />position: relative;
   <br />z-index: 3;
</div>

<div id="reldiv2">
   <br /><span class="bold">DIV #3</span>
   <br />position: relative;
   <br />z-index: 2;
</div>

<div id="absdiv2">
   <br /><span class="bold">DIV #4</span>
   <br />position: absolute;
   <br />z-index: 1;
</div>

<div id="normdiv">
   <br /><span class="bold">DIV #5</span>
   <br />no positioning
   <br />z-index: 8;
</div>

</body></html>