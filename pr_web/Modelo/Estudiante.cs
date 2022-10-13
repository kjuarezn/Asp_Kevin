using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Modelo
{

    public class Estudiante
    {
        ConexionBD conectar;
        private DataTable drop_sangre()
        {
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select id_tipo_sangre as id,sangre from tipos_sangre;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerrarConexion();
            return tabla;
        }
        private DataTable grid_estudiantes()
        {
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select e.id_estudiante as id,e.codigo,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo_electronico,e.fecha_nacimiento,t.sangre,e.id_tipo_sangre\r\nFrom estudiantes as e inner join tipos_sangres as t on e.id_tipo_sangre = t.id_tipo_sangre;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerrarConexion();
            return tabla;
        }
public void drop_tipo_sangre(DropDownList drop){
            drop.ClearSelection();
            drop.Items.Clear();
            drop.AppendDataBoundItems = true;
            drop.Items.Add("<<Elige Tipo Sangre>>");
            drop.Items[0].Value = "0";
            drop.DataSource = drop_tipo_sangre();
            drop.DataTextField = "sangre";
            drop.DataValueField = "id";
            drop.DataBind();

        }
        public void grid_estudiantes(GridView grid)
        {
            grid.DataSource = grid_estudiantes();
            grid.DataBind();
        }
        public int crear(string codigo, string nombres, string apellidos, string direccion, string telefono, string correo, string fecha, int id_tipo_sangre)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("INSERT INTO estudiantes (codigo,nombres,apellidos,direccion,telefono,correo_electronico,fecha_nacimiento,id_tipo_sangre) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}',{7});",codigo,nombres,apellidos,direccion,telefono,correo,fecha,id_tipo_sangre);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();

            conectar.CerrarConexion();
            return no;

           
        }
        public int actualizar(int id,string codigo, string nombres, string apellidos, string direccion, string telefono, string correo, string fecha, int id_tipo_sangre)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("update  estudiantes set codigo='{0}',nombres='{1}',apellidos='{2}',direccion='{3}',telefono='{4}',correo_electronico='{5}',fecha_nacimiento='{6}',id_tipo_sangre={7} where id_tipo_sangre={7};", codigo, nombres, apellidos, direccion, telefono, correo, fecha, id_tipo_sangre,id);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();

            conectar.CerrarConexion();
            return no;


        }
        public int borrar(int id)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("delete from  estudiantes where id_tipo_sangre={0};", id);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();

            conectar.CerrarConexion();
            return no;


        }
    }
}
