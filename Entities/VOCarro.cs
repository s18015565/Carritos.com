using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    class VOCarro
    {

        public int IdCarro { get; set; }
        public string Matricula { get; set; }
        public int Año { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public bool Disponibilidad { get; set; }
        public string UrlFoto { get; set; }

        public VOCarro(int idCarro, string matricula, int año, string marca, 
            string modelo, bool disponibilidad, string urlFoto)
        {
            IdCarro = idCarro;
            Matricula = matricula;
            Año = año;
            Marca = marca;
            Modelo = modelo;
            Disponibilidad = disponibilidad;
            UrlFoto = urlFoto;
        }

        public VOCarro(DataRow fila)
        {
            IdCarro = (int)fila["IdCarro"];
            Matricula = (string)fila["Matricula"];
            Año = (int)fila["Año"];
            Marca = (string)fila["Marca"];
            Modelo = (string)fila["Modelo"];
            Disponibilidad = bool.Parse(fila["Disponibilidad"].ToString());
            UrlFoto = (string)fila["UrlFoto"];
        }
    }


    }
}
