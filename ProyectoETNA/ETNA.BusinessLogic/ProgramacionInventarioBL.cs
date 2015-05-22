using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class ProgramacionInventarioBL
    {
        private static ProgramacionInventarioDA objProgInventario;

        public ProgramacionInventarioBL()
        {
            objProgInventario = new ProgramacionInventarioDA();
        }

        public List<ProgramacionInventarioBE> ObtenerInventariosProgramados(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.ObtenerInventariosProgramados(oBe);
        }

        public List<ProgramacionInventarioBE> ObtenerInventarios(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.ObtenerInventarios(oBe);
        }

        public int RegistrarInventariosProgramados(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.RegistrarInventariosProgramados(oBe);
        }

        public int ActualizarInventariosProgramados(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.ActualizarInventariosProgramados(oBe);
        }

        public int EliminarInventariosProgramados(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.EliminarInventariosProgramados(oBe);
        }

        public int IniciarInventario(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.IniciarInventario(oBe);
        }

        public int AjustarInventario(ProgramacionInventarioBE oBe)
        {
            return objProgInventario.AjustarInventario(oBe);
        }
    }
}
