package Controladores;

import JpaControladoras.PreguntasJpaController;
import java.util.List;
import javabeans.Preguntas;

/**
 *
 * @author torta
 */
public class ControladoraPreguntas {
    
    PreguntasJpaController preJpa = new PreguntasJpaController();

    /**
     * metodo que añade nuestra pregunta a la base de datos
     *
     * @param pregunta
     */
    public void crearPregunta(Preguntas pregunta) {
        preJpa.create(pregunta);
    }

    /**
     * este metodo nos muestra todas las preguntas existentes cuando lo llamen
     * desde el formulario de creaciones.jsp
     *
     * @return
     */
    public List<Preguntas> traerPreguntas() {
        return preJpa.findPreguntasEntities();
    }
    
    public void eliminarPregunta(int id) {
        preJpa.destroy(id);
    }
}
