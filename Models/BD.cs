using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace agussiro06_tp9.Models;

public class BD 
{
    private static List<Juego> ListadoJuegos= new List<Juego>();
    private static List<Juego> ListadoJuegosEspecificos= new List<Juego>();
    private static List<Consola> ListadoConsolas= new List<Consola>();
    //CAMBIAR SERVIDOR 
    private static string  _connectionstring = @"Server=A-PHZ2-CIDI-036;DataBase=ConsoleWorld;Trusted_Connection=True;";
    public static List<Consola> ListarConsolas ()
    {
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql = "SELECT * FROM Consola";
            ListadoConsolas = db.Query<Consola>(sql).ToList();
        }
        return ListadoConsolas;
    }
    public static List<Juego> ListarJuegos ()
    {
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql = "SELECT * FROM Juego";
            ListadoJuegos = db.Query<Juego>(sql).ToList();
        }
        return ListadoJuegos;
    }
    public static List<Juego> ListarJuegosEspecificos(int idConsola)
    {
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql = "SELECT * FROM Juego WHERE IdConsola=@pIdConsola";
            ListadoJuegosEspecificos = db.Query<Juego>(sql, new {pIdConsola=idConsola}).ToList();
        }
        return ListadoJuegosEspecificos;
    }  
    public static Consola DetalleConsola(int IdConsola)
    {
            Consola ConsolaElegida=null;
            using(SqlConnection db = new SqlConnection(_connectionstring)){
                string sql = "SELECT * FROM Consola WHERE IdConsola=@pIdConsola";
                ConsolaElegida = db.QueryFirstOrDefault<Consola>(sql, new {pIdConsola = IdConsola});
        }
            System.Console.WriteLine(ConsolaElegida.Nombre);
            return ConsolaElegida;
    }
    public static Juego DetalleJuego(int IdJuego)
    {
            Juego JuegoElegido=null;
        using(SqlConnection db = new SqlConnection(_connectionstring)){
                string sql = "SELECT * FROM Juego WHERE IdJuego=@pIdJuego";
            JuegoElegido = db.QueryFirstOrDefault<Juego>(sql, new {pIdJuego = IdJuego});
        }
        return JuegoElegido;
    }
    public static Usuario TraerUsuario()
    {
        Usuario Usuario=null;
        using(SqlConnection db = new SqlConnection(_connectionstring)){
                string sql = "SELECT * FROM Usuario";
            Usuario = db.QueryFirstOrDefault<Usuario>(sql);;
        }
        return Usuario;
    }
    public static void AgregarFavorito(int IdJuego)
    {
        using(SqlConnection db=new SqlConnection(_connectionstring)){
            string sql="UPDATE Juego SET Favorito='0' WHERE Favorito='1'";
            db.Execute(sql,new {pIdJuego=IdJuego});
        }
        using(SqlConnection db=new SqlConnection(_connectionstring)){
            string sql="UPDATE Juego SET Favorito='1' WHERE idJuego=@pIdJuego";
            db.Execute(sql,new {pIdJuego=IdJuego});
        }
    }
    public static Juego DetalleFavorito()
    {
        Juego JuegoFavorito=null;
        using(SqlConnection db = new SqlConnection(_connectionstring)){
                string sql = "SELECT * FROM Juego WHERE Favorito='1'";
            JuegoFavorito = db.QueryFirstOrDefault<Juego>(sql);
        }
        return JuegoFavorito;
    }
    public static void AgregarConsola(Consola Consola)
    {
        string sql="INSERT INTO Consola (Nombre,FechaSalida,Empresa,Informacion,Portada) VALUES (@pNombre,@pFechaSalida,@pEmpresa,@pInformacion,@pPortada)";
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            db.Execute(sql,new {pNombre=Consola.Nombre,pFechaSalida=Consola.FechaSalida,pEmpresa=Consola.Empresa,pInformacion=Consola.Informacion,pPortada=Consola.Portada});
        }
    }
    public static void AgregarJuego(Juego Juego)
    {
        string sql="INSERT INTO Juego (Nombre,idConsola,FechaSalida,Desarrolladora,Informacion,Portada) VALUES (@pNombre,@pidConsola,@pFechaSalida,@pDesarrolladora,@pInformacion,@pPortada)";
         using(SqlConnection db = new SqlConnection(_connectionstring)){
            db.Execute(sql,new {pNombre=Juego.Nombre,pidConsola=Juego.idConsola,pFechaSalida=Juego.FechaSalida,pDesarrolladora=Juego.Desarrolladora,pInformacion=Juego.Informacion,pPortada=Juego.Portada});
        }
    }
    public static void BorrarConsola(int idConsola)
    {
        using(SqlConnection db=new SqlConnection(_connectionstring)){
            string sql="DELETE FROM Consola WHERE idConsola=@pidConsola";
            db.Execute(sql,new {pidConsola=idConsola});
        }
    }
    public static void BorrarJuego(int idJuego)
    {
        using(SqlConnection db=new SqlConnection(_connectionstring)){
            string sql="DELETE FROM Juego WHERE idJuego=@pidJuego";
            db.Execute(sql,new {pidJuego=idJuego});
        }
    }
}