package logica;

import JpaControladoras.PreguntasJpaController;

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
}
