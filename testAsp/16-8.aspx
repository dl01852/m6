<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="16-8.aspx.cs" Inherits="testAsp._16_8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        table,th,tr,td {
            border: 1px blue groove;
        }
    </style>
    <script>
        var products;
        var thumbnails;
        var images;
        var description;
        var asyncRequest1;
        var asyncRequest2;
        var asyncRequest3;
        var asyncRequest4;
        var thumbTag;

        function loadJson(url1, url2, url3, url4) { // AsyncRequest to for all the json files.
            try {
                asyncRequest1 = new XMLHttpRequest();
                asyncRequest1.addEventListener("readystatechange", parseData, false); // had a hanging response because i didnt have this line
                asyncRequest1.open("GET", url1, true);
                asyncRequest1.send(null);

                asyncRequest2 = new XMLHttpRequest();
                asyncRequest2.addEventListener("readystatechange", parseData, false);
                asyncRequest2.open("GET", url2, true);
                asyncRequest2.send(null);

                asyncRequest3 = new XMLHttpRequest();
                asyncRequest3.addEventListener("readystatechange", parseData, false);
                asyncRequest3.open("GET", url3, true);
                asyncRequest3.send(null);


                asyncRequest4 = new XMLHttpRequest();
                asyncRequest4.addEventListener("readystatechange", parseData, false);
                asyncRequest4.open("GET", url4, true);
                asyncRequest4.send(null);
            } catch (e) {
                alert(e.message); // tell me what happened.
            }
        }

        function parseData() { // ReadyState 4 means it completed. and we make sure the status is 200 for all the asyncRequest
            if ((asyncRequest1.readyState == 4 && asyncRequest1.status == 200) && (asyncRequest2.readyState == 4 && asyncRequest2.status == 200) &&
            (asyncRequest3.readyState == 4 && asyncRequest3.status == 200) && (asyncRequest4.readyState == 4 && asyncRequest4.status == 200)) {

                // Parse the Json into objects
                products = JSON.parse(asyncRequest1.responseText);
                thumbnails = JSON.parse(asyncRequest2.responseText);
                images = JSON.parse(asyncRequest3.responseText);
                description = JSON.parse(asyncRequest4.responseText);

                // pass the objects to this function to display.
                displayData(products, thumbnails);
            }
        }

        function displayData(products, thumbnails) {
            // the table for the output.
            var output = document.getElementById("data");
            var outputTable = document.createElement("table");
            var outputBody = document.createElement("tbody");

            for (var i = 0; i < products.Products.length; i++) {

                // creation of new tags.
                var thumbnail = thumbnails.Thumbnails[i].Thumbnail;
                var productRow = document.createElement("tr");
                var imageCell = document.createElement("td");
                var dataCell = document.createElement("td");
                var fillRow = document.createElement("tr");
                var spanTag = document.createElement("span");
                var imageSpan = document.createElement("span");
                var btnDescription = document.createElement("input");
                var tblDataTag = document.createElement("td");
                var spanID = "data" + i;
                var tblData = document.createElement("div");
                thumbTag = document.createElement("img");

                //applying attributes and setting up eventHandlers.
                tblDataTag.setAttribute("colspan", 2);
                outputBody.setAttribute("align", "right");
                imageSpan.setAttribute("ID", "filler" + i);
                btnDescription.setAttribute("type", "button");
                btnDescription.setAttribute("value", "description");
                //buttonInput.addEventListener("click", function() { addDescription(i) }, false);
                btnDescription.setAttribute("onclick", "addDescription("+ i +")");
                btnDescription.setAttribute("align", "right");
                spanTag.setAttribute("ID", "data" + i);
                spanTag.setAttribute("align", "left");
                //thumbTag.addEventListener("mouseover", function() { mouseOver(i) }, false);
                thumbTag.setAttribute("onmouseout","mouseOut(" + i + ")");
                thumbTag.setAttribute("onmouseover", "mouseOver(" + i + ")");
                thumbTag.setAttribute("src", thumbnail); // see about this!
                thumbTag.setAttribute("ID", "thumbnail" + i);

                //appending tags together and piecing the table.
                imageCell.appendChild(thumbTag);
                dataCell.appendChild(spanTag);
                productRow.appendChild(imageCell);
                productRow.appendChild(dataCell);
                tblData.appendChild(imageSpan);
                tblData.appendChild(btnDescription);
                tblDataTag.appendChild(tblData);
                fillRow.appendChild(tblDataTag);
                outputBody.appendChild(productRow);
                outputBody.appendChild(fillRow);
                outputTable.appendChild(outputBody);
                output.appendChild(outputTable);
                document.getElementById(spanID).innerHTML = products.Products[i].Title + '<p><strong>Price: ' + products.Products[i].Price + '</strong></p>';
            }
        }

        function mouseOut(id) {

            document.getElementById("thumbnail" + id).setAttribute("src", thumbnails.Thumbnails[id].Thumbnail);
        }
        function mouseOver(id) {
             document.getElementById("thumbnail" + id).setAttribute("src", images.Images[id].Image);
            
        }

        function addDescription(id) {
           document.getElementById("filler" + id).innerHTML = description.Descriptions[id].Description;
        }
        
    </script>
</head>
<body onload='loadJson("jsonFiles/summary.json", "jsonFiles/thumbnails.json", "jsonFiles/images.json", "jsonFiles/description.json")'>

<div id="data">

</div>
</body>
</html>
