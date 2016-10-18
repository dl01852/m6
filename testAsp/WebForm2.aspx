<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="testAsp.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <asp:TextBox name="name" id="txtName" type="text" size="25" runat="server"/>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldNameValidator" ErrorMessage="Name is required" ControlToValidate="txtName"/>
        </p>

        <!-- <textarea> creates a multiline textbox -->
        <p>
            <asp:Label runat="server" Text="Comments:"/>
            <br/>
            <asp:TextBox runat="server" TextMode="MultiLine" rows="5" Text="Enter Comments here" Columns="36"/>
        </p>

        <!-- <input type="password"> inserts a -->
        <!-- textbox whose display is masked with -->
        <!-- asterisk characters -->
        <p>
            <asp:Label runat="server" Text="E-mail Address:"/>&nbsp;
            <asp:TextBox runat="server" TextMode="Email" Columns="25"/>
            <%--<input name = "email" type = "password"  size = "25">--%>
        </p>

        <p>
            <b>Things you liked:</b><br/>


            <asp:CheckBox runat="server" Text="Site Design" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Links" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Ease of use" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Images" TextAlign="Left"/>&nbsp;
            <asp:CheckBox runat="server" Text="Source code" TextAlign="Left"/>&nbsp;

        </p>

        <!-- <input type="radio"> creates a radio -->
        <!-- button. The difference between radio buttons -->
        <!-- and checkboxes is that only one radio button -->
        <!-- in a group can be selected. -->
        <p>
            <strong>How did you get to our site?:</strong><br/>


            <asp:RadioButton runat="server" GroupName="sites" Text="Search engine" TextAlign="Left"/>&nbsp;
            <asp:RadioButton runat="server" GroupName="sites" Text="Links from another site" TextAlign="Left"/>&nbsp;
            <asp:RadioButton runat="server" GroupName="sites" Text="Deitel.com WebSite" TextAlign="Left"/>&nbsp;
            <asp:RadioButton runat="server" GroupName="sites" Text="Reference in a book" TextAlign="Left"/>&nbsp;
            <asp:RadioButton runat="server" GroupName="sites" Text="Other" TextAlign="Left"/>&nbsp;
        </p>

        <p>
            <asp:Label runat="server" Text="Rate our site:"/>
            <asp:DropDownList runat="server" id="lstRatings">
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

        </p>

        <p>
            <input type="submit" value="Submit"/>
            <asp:Button runat="server" Text="Clear"/>
        </p>

    </div>
</form>
</body>
</html>
