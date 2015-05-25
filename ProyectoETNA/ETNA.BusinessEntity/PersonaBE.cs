using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class PersonaBE
    {
        #region Fields

        private int in_idPersona;
        private int in_tipoPersona;
        private string vc_nombres;
        private string vc_apellidoPaterno;
        private string vc_apellidoMaterno;
        private string vc_razonSocial;
        private int in_tipoDocIdentidad;
        private string vc_numeroDocIdentidad;
        private string vc_direccion;
        private string vc_telefono;
        private string vc_correo;
        private string vc_paginaWeb;
        private DateTime dt_fechaNacimiento;
        private string vc_cargo;
        private string vc_centrocosto;
        private int in_activo;
        private DateTime dt_fechaIngreso;
        private string ch_Cod_Usuario;
        private DateTime dt_fechaCreacion;
        private DateTime dt_fechaModificacion;

        #endregion

        #region Constructors

        public PersonaBE()
        {
        }

        #endregion

        #region Properties

        public int In_idPersona
        {
            get { return in_idPersona; }
            set { in_idPersona = value; }
        }

        public int In_tipoPersona
        {
            get { return in_tipoPersona; }
            set { in_tipoPersona = value; }
        }

        public string Vc_nombres
        {
            get { return vc_nombres; }
            set { vc_nombres = value; }
        }

        public string Vc_apellidoPaterno
        {
            get { return vc_apellidoPaterno; }
            set { vc_apellidoPaterno = value; }
        }

        public string Vc_apellidoMaterno
        {
            get { return vc_apellidoMaterno; }
            set { vc_apellidoMaterno = value; }
        }

        public string Vc_razonSocial
        {
            get { return vc_razonSocial; }
            set { vc_razonSocial = value; }
        }

        public int In_tipoDocIdentidad
        {
            get { return in_tipoDocIdentidad; }
            set { in_tipoDocIdentidad = value; }
        }

        public string Vc_numeroDocIdentidad
        {
            get { return vc_numeroDocIdentidad; }
            set { vc_numeroDocIdentidad = value; }
        }

        public string Vc_direccion
        {
            get { return vc_direccion; }
            set { vc_direccion = value; }
        }

        public string Vc_telefono
        {
            get { return vc_telefono; }
            set { vc_telefono = value; }
        }

        public string Vc_correo
        {
            get { return vc_correo; }
            set { vc_correo = value; }
        }

        public string Vc_paginaWeb
        {
            get { return vc_paginaWeb; }
            set { vc_paginaWeb = value; }
        }

        public DateTime Dt_fechaNacimiento
        {
            get { return dt_fechaNacimiento; }
            set { dt_fechaNacimiento = value; }
        }

        public string Vc_cargo
        {
            get { return vc_cargo; }
            set { vc_cargo = value; }
        }

        public string Vc_centrocosto
        {
            get { return vc_centrocosto; }
            set { vc_centrocosto = value; }
        }

        public int In_activo
        {
            get { return in_activo; }
            set { in_activo = value; }
        }

        public DateTime Dt_fechaIngreso
        {
            get { return dt_fechaIngreso; }
            set { dt_fechaIngreso = value; }
        }

        public string Ch_Cod_Usuario
        {
            get { return ch_Cod_Usuario; }
            set { ch_Cod_Usuario = value; }
        }

        public DateTime Dt_fechaCreacion
        {
            get { return dt_fechaCreacion; }
            set { dt_fechaCreacion = value; }
        }

        public DateTime Dt_fechaModificacion
        {
            get { return dt_fechaModificacion; }
            set { dt_fechaModificacion = value; }
        }

        #endregion
    }
}
