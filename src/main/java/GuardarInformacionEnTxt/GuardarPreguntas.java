package GuardarInformacionEnTxt;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author torta
 */
//system userget proporty guardar en carpeta home
public class GuardarPreguntas {

    // directorio home del usuario
    private static final String RUTA_GUARDADO_PREGUNTAS = System.getProperty("user.home") + "/misPreguntasGuardadas";
    private static String terminacionArchivo = ".txt";

    public static void guardarInformacionEnArchivo(String texto, int identificadorExamen) {
        String rutaDefinitiva = RUTA_GUARDADO_PREGUNTAS + identificadorExamen + terminacionArchivo;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaDefinitiva, true))) {
            writer.write(texto);
            writer.newLine(); //añado una linea nueva para evitar que se sobrelapen preguntas
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
