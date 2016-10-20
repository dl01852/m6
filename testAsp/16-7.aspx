<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="16-7.aspx.cs" Inherits="testAsp.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script>
        
    </script>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <h1>Feedback Form</h1>
        <p>
            Please fill out this form to help
            us improve our site.
        </p>


        <input type="hidden" name="recipient"
               value="deitel@deitel.com"/>
        <input type="hidden" name="subject"
               value="Feedback Form"/>
        <input type="hidden" name="redirect"
               value="main.html"/>


        <p>
            <asp:Label id="lblName" runat="server" Text="Name:"/>&nbsp;
            <asp:TextBox name="name"  id="txtName" type="text" size="25" runat="server"/>
               <!-- FIELD VALIDATOR FOR Name -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>

     
        <p>
            <asp:Label runat="server" Text="Comments:"/>
            <br/>
            <asp:TextBox runat="server" TextMode="MultiLine" rows="5" Text="Enter Comments here" Columns="36"/>
            
        </p>

        <p>
            <asp:Label runat="server" Text="E-mail Address:"/>&nbsp;
            <asp:TextBox runat="server" id="txtEmail" TextMode="Email" Columns="25"/>
            
            <!-- FIELD VALIDATOR FOR EMAIL -->
            <asp:RequiredFieldValidator runat="server" id="RequiredEmailField" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="*" EnableClientScript="True"/>
            <asp:RegularExpressionValidator runat="server" id="RegularExpressionEmailValidator" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/>
        </p><br/>
        <a href="xmlFiles/bannedEmails.xml">Banned Emails</a>

        <p>
            <b>Things you liked:</b><br/>


            <asp:CheckBox  runat="server" Text="Site Design" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Links" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Ease of use" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Images" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Source code" TextAlign="Left"/>&nbsp;

        </p>

    
        <p>
            <strong>How did you get to our site?:</strong>
            <!-- Field Valdiator for radio buttons -->
           <asp:RequiredFieldValidator runat="server" ControlToValidate="radBtns" ErrorMessage="*" ForeColor="Red"/>
            <br/>
            <asp:RadioButtonList runat="server" TextAlign="Left" RepeatDirection="Horizontal" id="radBtns">
                <asp:ListItem runat="server" Text="Search Engine"/>
                <asp:ListItem runat="server" Text="Links from another site"/>
                <asp:ListItem runat="server" Text="Deitel.com Website"/>
                <asp:ListItem runat="server" Text="Reference in a book"/>
                <asp:ListItem runat="server" Text="Other"/>
            </asp:RadioButtonList>   
        </p>

        <p>
            <asp:Label runat="server" Text="Rate our site:"/>
            <asp:DropDownList runat="server" id="lstRatings" >
                <asp:ListItem Value="-1"> rating</asp:ListItem>
                <asp:ListItem>Amazing</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>Awful</asp:ListItem>
            </asp:DropDownList>
            <!-- Field validator for Rating the site -->
            <asp:RequiredFieldValidator runat="server" id="requiredRatingValidator" ForeColor="Red" InitialValue="-1" ControlToValidate="lstRatings" ErrorMessage="*"/>

        </p>

        <p>
            <asp:Button runat="server" Text="Submit" id="btnSubmit" OnClick="btnSubmit_Click"/>
            <asp:Button runat="server" Text="Clear"/>
        </p>

    </div>
</form>
</body>
</html>