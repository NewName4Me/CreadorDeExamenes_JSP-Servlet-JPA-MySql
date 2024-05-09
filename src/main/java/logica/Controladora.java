package logica;

import java.util.List;
import persistencias.UsuarioJpaController;

/**
 *
 * @author torta
 */
public class Controladora {

    UsuarioJpaController usuJpa = new UsuarioJpaController();

    /**
     * metodo que conecta con la controladora de persistencias para crearnos un
     * usuario
     *
     * @param usuario
     */
    public void crearUsuario(Usuario usuario) {
        usuJpa.create(usuario);
    }

    /**
     * meteodo que toma la lista creada la controladora de persistencias para
     * traernos una lista de usuarios
     *
     * @return
     */
    public List<Usuario> traerUsuario() {
        return usuJpa.findUsuarioEntities();
    }
}
