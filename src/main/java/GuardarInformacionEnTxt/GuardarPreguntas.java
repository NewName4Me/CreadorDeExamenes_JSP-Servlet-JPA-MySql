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
    private static String rutaGuardadoPreguntas = System.getProperty("user.home") + "/misPreguntasGuardadas.txt";

    public static void guardarInformacionEnArchivo(String texto) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaGuardadoPreguntas, true))) {
            writer.write(texto);
            writer.newLine(); //añado una linea nueva para evitar que se sobrelapen preguntas
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
