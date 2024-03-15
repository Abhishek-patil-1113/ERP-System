<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ERP_System.HomePage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

    <style>
        .jumbotron {
            background-color: antiquewhite;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif
        }

        .col-3 {
            width: 20%;
        }

        body {
            background-color: #edf1fe;
        }

        .col-9 {
            width: 80%;
        }

        display-4 {
        }

        .division {
            width: 50%;
        }

        .calender1 {
            margin: auto;
            width: 50%;
        }

        .marginb {
            margin-bottom: 5%;
        }

        .table-red {
            background-color: #f8d7da;
        }

        .table-orange {
            background-color: #fff3cd;
        }

        .ftb {
            margin: 5px;
            padding: 5px;
        }

        .thbrow {
            padding: 5px;
            margin: 5px;
            color: black;
            font-size: larger;
            font-weight: bold;
            font-family: 'Segoe UI';
        }

        .tbrow {
            /*padding: 5px;*/
            /*margin: 3px;*/
        }
    </style>

    <title></title>
</head>
<body>

    <%--heading--%>

    <form id="form1" runat="server">
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">ERP</h1>
                <p class="lead">Enterprise Resource Planning System</p>
            </div>
        </div>
        <hr style="height: 2px; color: black;" />
        <%--Navbar buttons--%>

        <div class="row">
            <div class="col-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <button class="nav-link active" id="v-pills-home-tab" data-toggle="pill" data-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Dashboard</button>
                    <button class="nav-link" id="v-pills-profile-tab" data-toggle="pill" data-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Product Management</button>
                    <button class="nav-link" id="v-pills-messages-tab" data-toggle="pill" data-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Order Management</button>
                </div>
            </div>
            <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">

                    <%--Dashboard tab--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <%--counts--%>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div style="width: 100%">

                                    <div class="alert alert-info" role="alert" style="display: inline-block; width: 33%;">
                                        Total Products : 
                                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                                    </div>

                                    <div class="alert alert-warning" role="alert" style="display: inline-block; width: 33%;">
                                        Pending Orders : 
                                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                                    </div>

                                    <div class="alert alert-danger" role="alert" style="display: inline-block; width: 33%;">
                                        Delayed Orders : 
                                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%--tables--%>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class=" table-responsive-sm" style="width: 49%; display: inline-block; vertical-align: top">
                                    <div class="p-3 mb-2 bg-warning text-dark">Low quantity WARNING.</div>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductID" PageSize="5" DataSourceID="SqlDataSource2" CssClass="table table-responsive table-bordered table-hover table-warning">
                                        <Columns>
                                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID"></asp:BoundField>
                                            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName"></asp:BoundField>
                                            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName"></asp:BoundField>
                                            <asp:BoundField DataField="StockQuantity" HeaderText="StockQuantity" SortExpression="StockQuantity"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class=" table-responsive-sm " style="width: 49%; display: inline-block; vertical-align: top">
                                    <div class="p-3 mb-2 bg-danger text-white">Delayed Orders.</div>
                                    <asp:GridView ID="GridView3" runat="server" AllowPaging="true" PageSize="5" CssClass="table table-responsive table-bordered table-hover table-danger" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="OrderID">
                                        <Columns>
                                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID"></asp:BoundField>
                                            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName"></asp:BoundField>
                                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate"></asp:BoundField>
                                            <asp:BoundField DataField="OrderStatus" HeaderText="OrderStatus" SortExpression="OrderStatus"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ERP SystemConnectionString4 %>' ProviderName='<%$ ConnectionStrings:ERP SystemConnectionString4.ProviderName %>' SelectCommand="SELECT * FROM [Orders] WHERE (([OrderDate] < @OrderDate) AND ([OrderStatus] = @OrderStatus))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label9" PropertyName="Text" DbType="Date" Name="OrderDate"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="Pending" Name="OrderStatus" Type="String"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ERP SystemConnectionString2 %>' DeleteCommand="DELETE FROM [Product] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Product] ([ProductID], [ProductName], [CategoryName], [StockQuantity]) VALUES (@ProductID, @ProductName, @CategoryName, @StockQuantity)" ProviderName='<%$ ConnectionStrings:ERP SystemConnectionString2.ProviderName %>' SelectCommand="SELECT [ProductID], [ProductName], [CategoryName], [StockQuantity] FROM [Product] WHERE ([StockQuantity] <= @StockQuantity)" UpdateCommand="UPDATE [Product] SET [ProductName] = @ProductName, [CategoryName] = @CategoryName, [StockQuantity] = @StockQuantity WHERE [ProductID] = @ProductID">
                            <DeleteParameters>
                                <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
                                <asp:Parameter Name="CategoryName" Type="String"></asp:Parameter>
                                <asp:Parameter Name="StockQuantity" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="20" Name="StockQuantity" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
                                <asp:Parameter Name="CategoryName" Type="String"></asp:Parameter>
                                <asp:Parameter Name="StockQuantity" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>

                    <%--Product management tab--%>

                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="table-responsive" style="width: 63%; display: inline-block;">

                                    <div class="alert alert-secondary" role="alert" style="display: inline-block; width: 100%; text-align: center">
                                        List of All Products. 
                                    </div>

                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductID" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" PageSize="15"
                                        Width="100%" CssClass="table table-responsive table-bordered table-hover table-secondary rounded" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataSourceID="SqlDataSource1" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Product ID" SortExpression="ProductID">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("ProductID") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ProductID") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("ProductName") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ProductName") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Category" SortExpression="CategoryName">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("CategoryName") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("CategoryName") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("Price") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("Price") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Stock Quantity" SortExpression="StockQuantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("StockQuantity") %>' ID="TextBox4"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("StockQuantity") %>' ID="Label5"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ERP SystemConnectionString %>' DeleteCommand="DELETE FROM [Product] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Product] ([ProductID], [ProductName], [CategoryName], [Price], [StockQuantity]) VALUES (@ProductID, @ProductName, @CategoryName, @Price, @StockQuantity)" ProviderName='<%$ ConnectionStrings:ERP SystemConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [ProductName] = @ProductName, [CategoryName] = @CategoryName, [Price] = @Price, [StockQuantity] = @StockQuantity WHERE [ProductID] = @ProductID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="CategoryName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Price" Type="Double"></asp:Parameter>
                                            <asp:Parameter Name="StockQuantity" Type="Int32"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="CategoryName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="Price" Type="Double"></asp:Parameter>
                                            <asp:Parameter Name="StockQuantity" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div style="display: inline-block; width: 34%; vertical-align: top;">
                                    <asp:Table ID="Table1" runat="server" Width="100%"   CssClass="p-3 mb-2 bg-secondary text-white ftb rounded" CellPadding="9">
                                        <asp:TableRow>
                                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center" CssClass="thbrow" Font-Bold="true" >Insert New Product</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow></asp:TableRow>
                                        <asp:TableRow CssClass="tbrow">
                                            <asp:TableCell>
                                                <asp:Label ID="Label10" runat="server" Text="Product ID : "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="TextBox5" Width="100%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox5" runat="server" ErrorMessage="ID required" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="tbrow">
                                            <asp:TableCell>
                                                <asp:Label ID="Label11" runat="server" Text="Product Name :"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="TextBox6" Width="100%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox6" runat="server" ErrorMessage="Name required" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="tbrow">
                                            <asp:TableCell>
                                                <asp:Label ID="Label12" runat="server" Text="Category : "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:DropDownList ID="DropDownList1" Width="100%" runat="server">
                                                    <asp:ListItem>Home appliances</asp:ListItem>
                                                    <asp:ListItem>Phone</asp:ListItem>
                                                    <asp:ListItem>Laptop</asp:ListItem>
                                                    <asp:ListItem>Clothing</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="tbrow">
                                            <asp:TableCell>
                                                <asp:Label ID="Label13" runat="server" Text="Price : "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="TextBox8" Width="100%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox8" runat="server" ErrorMessage="price required" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow CssClass="tbrow">
                                            <asp:TableCell>
                                                <asp:Label ID="Label14" runat="server" Text="Quantity : "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="TextBox7" Width="100%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox7" runat="server" ErrorMessage="quantity required" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                                <asp:Button ID="Button1" runat="server" Text="Insert" CssClass="btn btn-dark" OnClick="Button1_Click" />
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                                <asp:Label ID="Label15" runat="server" Text="" CssClass="thbrow" ForeColor="Red"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                                <%--<asp:LinkButton ID="LinkButton1" runat="server">zzzzzzzzz</asp:LinkButton>--%>
                                <%--<button type="button" data-toggle="modal" data-target="#myModal">Launch modal</button>--%>
                                <%--<asp:Panel ID="Panel1" runat="server">
                                    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    ...
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Understood</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton1" PopupControlID="Panel1"></cc1:ModalPopupExtender>--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>


                    <%--Order tab--%>

                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div style="width: 45%; display: inline-block; vertical-align: top">
                                    <div class="alert alert-success" role="alert" style="display: inline-block; width: 100%; text-align: center">
                                        Select the date to get all the expected deliveries on that date.
                                    </div>
                                    <asp:Calendar ID="Calendar1" runat="server" CssClass="calender1 marginb" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                    <asp:GridView ID="GridView5" runat="server" CssClass="calender1 table table-responsive table-bordered table-hover table-primary" Width="100%" OnSelectedIndexChanged="GridView5_SelectedIndexChanged" GridLines="Horizontal"></asp:GridView>
                                </div>
                                <div class=" table-responsive-sm" style="width: 45%; display: inline-block; vertical-align: top">
                                    
                                    <div class="alert alert-success" role="alert" style="display: inline-block; width: 100%; text-align: center">
                                        List of All the orders.
                                    </div>
                                    <asp:GridView ID="GridView4" runat="server" Width="100%" CssClass="table table-responsive table-borderless table-hover table-striped table-active" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" OnRowDataBound="GridView4_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("OrderID") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("OrderID") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("CustomerName") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("CustomerName") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OrderDate" SortExpression="OrderDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("OrderDate") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("OrderDate") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OrderStatus" SortExpression="OrderStatus">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("OrderStatus") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("OrderStatus") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:CommandField ShowDeleteButton="True"></asp:CommandField>

                                            <asp:CommandField SelectText="Change Status" ShowSelectButton="True"></asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ERP SystemConnectionString5 %>' DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [Orders] ([OrderID], [CustomerName], [OrderDate], [OrderStatus]) VALUES (@OrderID, @CustomerName, @OrderDate, @OrderStatus)" ProviderName='<%$ ConnectionStrings:ERP SystemConnectionString5.ProviderName %>' SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [CustomerName] = @CustomerName, [OrderDate] = @OrderDate, [OrderStatus] = @OrderStatus WHERE [OrderID] = @OrderID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="OrderID" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="OrderID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="CustomerName" Type="String"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="OrderDate"></asp:Parameter>
                                            <asp:Parameter Name="OrderStatus" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="CustomerName" Type="String"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="OrderDate"></asp:Parameter>
                                            <asp:Parameter Name="OrderStatus" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="OrderID" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>

        <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>

        <%--Scripting area--%>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script>

            $(document).ready(function () {
                var activeTab = sessionStorage.getItem('activeTab');
                if (activeTab) {
                    $('#v-pills-tab button[data-target="' + activeTab + '"]').tab('show');
                    loadTabContent(activeTab);
                }

                $('#v-pills-tab button[data-toggle="pill"]').on('click', function () {
                    var target = $(this).data('target');
                    sessionStorage.setItem('activeTab', target);
                    loadTabContent(target);
                });

                function loadTabContent(target) {
                    $.ajax({
                        url: 'LoadContent.aspx?tab=' + target.substring(1),
                        success: function (data) {
                            $(target).html(data);
                        },
                        error: function () {
                            $(target).html('Error loading content');
                        }
                    });
                }
            });
        </script>
    </form>
</body>
</html>
