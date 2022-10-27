using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace agussiro06_tp9.Models;

public class BD 
{
    private static List<Juego> ListadoJuegos= new List<Juego>();
    private static List<Consola> ListadoConsolas= new List<Consola>();
    //CAMBIAR SERVIDOR 
    private static string  _connectionstring = @"Server=A-PHZ2-CIDI-030;DataBase=ConsoleWorld;Trusted_Connection=True;";
    public static List<Consola> ListarConsolas ()
    {
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql = "SELECT * FROM Consola";
            ListadoConsolas = db.Query<Consola>(sql).ToList();
        }
        return ListadoConsolas;
    } 
    public static Consola DetalleConsola(string Consola){
        System.Console.WriteLine(Consola);
            Consola ConsolaElegida=null;
            foreach (Consola objConsola in ListadoConsolas){
                if (Consola==objConsola.Nombre){
                    ConsolaElegida=objConsola;
                }
            }
            return ConsolaElegida;
        }
}