<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="testAsp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script>
        var asyncRequest;
        var images = [];

        function registerListeners() {
            document.getElementById("all").addEventListener("click", function () { getImages("xmlFiles\\all.xml") }, false);
            document.getElementById("simply").addEventListener("click", function () { getImages("xmlFiles\\simply.xml") }, false);
            document.getElementById("howto").addEventListener("click", function () { getImages("xmlFiles\\howto.xml") }, false);
            document.getElementById("dotnet").addEventListener("click", function () { getImages("xmlFiles\\dotnet.xml") }, false);
            document.getElementById("javaccpp").addEventListener("click", function () { getImages("xmlFiles\\javaccpp.xml") }, false);
            document.getElementById("none").addEventListener("click",clearImages, false);
        }

        function getImages(url) {
          

            try {
                asyncRequest = new XMLHttpRequest();
                asyncRequest.addEventListener("readystatechange", processResponse, false);
                asyncRequest.open("GET", url, true);
                asyncRequest.send(null);
            } catch (e) {
                alert(e.message);
            } 
        }

        function processResponse() {
            if (asyncRequest.readyState == 4 && asyncRequest.status == 200 && asyncRequest.responseXML) {
                clearImages();

                var covers = asyncRequest.responseXML.getElementsByTagName("cover");
                var baseUrl = asyncRequest.responseXML.getElementsByTagName("baseurl").item(0).firstChild.nodeValue;
                var output = document.getElementById("covers");
                var titles = document.getElementById("titles");

                for (var i = 0; i < covers.length; i++) {
                    var cover = covers.item(i);
                    var image = cover.getElementsByTagName("image").item(0).firstChild.nodeValue;
                    var title = cover.getElementsByTagName("title").item(0).firstChild.nodeValue; // title.
                    var imageTag = document.createElement("img");

                    imageTag.setAttribute("src", baseUrl + escape(image));
                    imageTag.setAttribute("alt", title); // set the alt attribute of the title.
                    images.push(imageTag);
                    output.appendChild(imageTag);
                } // eend for loop

                registerImageListeners(); // i could probably register this all in one loop now that i understand, but whatever! 
                
            }// end if
        } // end function

        function registerImageListeners() { // FUCK YOU JAVASCRIPT.REFER HERE >>> https://http://stackoverflow.com/questions/19586137/addeventlistener-using-for-loop-and-passing-values
            
            for (var i = 0; i < images.length; i++) {
                (function() {
                    var title = images[i].getAttribute("alt");
                    images[i].addEventListener("mouseover", function () { showTitle(title); }, false);
                    images[i].addEventListener("mouseout", clearContent, false);

                }());
            }

          
        }

        function clearImages() {
            document.getElementById("covers").innerHTML = "";
        }

        function clearContent() {

            document.getElementById("title").innerHTML = "";
        }
        function showTitle(title) {
            document.getElementById("title").innerHTML = title;
        }
        window.addEventListener("load",registerListeners,false);
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:RadioButton id="all" runat="server" Text="all" GroupName="Books"/>
        <asp:RadioButton id="simply" runat="server" Text="Simple Books" GroupName="Books"/>
        <asp:RadioButton id="howto" runat="server" Text="How To Program books" GroupName="Books"/>
        <asp:RadioButton id="dotnet" runat="server" Text=".NET Books" GroupName="Books"/>
        <asp:RadioButton id="javaccpp" runat="server" Text="Java/C/C++ Books" GroupName="Books"/>
        <asp:RadioButton id="none" runat="server" Text="None" GroupName="Books"/>
        
   <div id = "covers"></div>

    </div>
        <div id="title"></div>
        
    </form>
</body>
</html>
