package persistencias;

import java.util.List;
import logica.Usuario;

/**
 *
 * @author torta
 */
public class ControladoraPersistencias {

    UsuarioJpaController usuJpa = new UsuarioJpaController();

    /**
     * metodo que contacta con el controlador JPA de usuario para añadir a un
     * nuevo usuario
     *
     * @param usuario
     */
    public void crearUsuario(Usuario usuario) {
        usuJpa.create(usuario);
    }

    /**
     * metodo que contacta con el controlador JPA de usuario para traernos una
     * lista de usuarios
     *
     * @return
     */
    public List<Usuario> traerUsuario() {
        return usuJpa.findUsuarioEntities();
    }
}
