package logica;

import java.util.List;
import persistencias.ControladoraPersistencias;

/**
 *
 * @author torta
 */
public class Controladora {

    ControladoraPersistencias controlPersis = new ControladoraPersistencias();

    /**
     * metodo que conecta con la controladora de persistencias para crearnos un
     * usuario
     *
     * @param usuario
     */
    public void crearUsuario(Usuario usuario) {
        controlPersis.crearUsuario(usuario);
    }

    /**
     * meteodo que toma la lista creada la controladora de persistencias para
     * traernos una lista de usuarios
     *
     * @return
     */
    public List<Usuario> traerUsuario() {
        return controlPersis.traerUsuario();
    }
}
