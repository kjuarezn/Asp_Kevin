<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="pr_web.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Formulario Empleados</h1>
    <asp:Label ID="lbl_codigo" runat="server" Text="Codigo" CssClass="badge"></asp:Label>
    <asp:TextBox ID="txt_codigo" runat="server" CssClass="form-control" placeholder="EJ:E001"></asp:TextBox>

    <asp:Label ID="lbl_nombres" runat="server" Text="Nombres" CssClass="badge"></asp:Label>
    <asp:TextBox ID="txt_nombres" runat="server" CssClass="form-control" placeholder="EJ:Nombre 1 Nombre 2"></asp:TextBox>

    <asp:Label ID="lbl_apellidos" runat="server" Text="Apellidos" CssClass="badge"></asp:Label>
    <asp:TextBox ID="txt_apellidos" runat="server" CssClass="form-control" placeholder="EJ:Apellido 1 Apellido 2"></asp:TextBox>

    <asp:Label ID="lbl_direccion" runat="server" Text="Direccion" CssClass="badge"></asp:Label>
    <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control" placeholder="EJ: # Calle avenida lugar"></asp:TextBox>

    <asp:Label ID="lbl_telefono" runat="server" Text="Telefono" CssClass="badge"></asp:Label>  
    <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" placeholder="EJ: # 2224445"></asp:TextBox>

    <asp:Label ID="lbl_correo" runat="server" Text="Correo Electronico" CssClass="badge"></asp:Label>  
    <asp:TextBox ID="txt_correo" runat="server" CssClass="form-control" placeholder="EJ: # 2224445"></asp:TextBox>
    
    <asp:Label ID="lbl_fn" runat="server" Text="Fecha Nacimiento" CssClass="badge"></asp:Label>
    <asp:TextBox ID="txt_fn" runat="server" CssClass="form-control" placeholder="EJ:yyyy-mm-dd" TextMode="Date" OnTextChanged="txt_fn_TextChanged"></asp:TextBox>

    <asp:Label ID="lbl_sangre" runat="server" Text="Tipo de Sangre" CssClass="badge"></asp:Label>
    <asp:DropDownList ID="drop_sangre" runat="server" CssClass="form-control"></asp:DropDownList>

    <asp:Button ID="btn_crear" runat="server" Text="Crear" CssClass="btn btn-primary" OnClick="btn_crear_Click"/>
    <asp:Button ID="btn_actualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btn_actualizar_Click" Visible="False" />

    <asp:Label ID="lbl_mensaje" runat="server" CssClass="badge"></asp:Label>
    <asp:GridView ID="grid_estudiantes" runat="server" AutoGenerateColumns="False" CssClass="table-condensed" DataKeyNames="id,id_puesto" OnRowDeleting="grid_empleados_RowDeleting" OnSelectedIndexChanged="grid_estudiantes_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btn_select" runat="server" CausesValidation="False" CommandName="Select" Text="ver" CssClass="btn btn-info" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btn_eliminar" runat="server" CausesValidation="False" CommandName="Delete" Text="Borrar" OnClick="Button2_Click" CssClass="btn btn-danger"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="codigo" HeaderText="Codigo" />
            <asp:BoundField DataField="nombres" HeaderText="Nombres" />
            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
            <asp:BoundField DataField="direccion" HeaderText="Direccion" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" />
	      <asp:BoundField DataField="correo_electronico" HeaderText="Correo" />
            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Nacimiento" DataFormatString="{0:d}" />
            <asp:BoundField DataField="tipo_sangre" HeaderText="Sangre" />
        </Columns>
    </asp:GridView>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

</asp:Content>
