import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SeleccionButacas extends JFrame implements ActionListener {
    private JButton[][] butacas;

    public SeleccionButacas(int filas, int columnas) {
        initComponents(filas, columnas);
    }

    private void initComponents(int filas, int columnas) {
        butacas = new JButton[filas][columnas];
        setLayout(new GridLayout(filas, columnas));

        ImageIcon iconoButaca = new ImageIcon("butaca.png");

        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                butacas[i][j] = new JButton("Fila " + (i + 1) + ", Asiento " + (j + 1), iconoButaca);
                butacas[i][j].setBackground(Color.GREEN); 
                butacas[i][j].addActionListener(this);
                add(butacas[i][j]);
            }
        }

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Selección de Butacas");
        setSize(800, 600);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JButton botonSeleccionado = (JButton) e.getSource();
        if (botonSeleccionado.getBackground() == Color.GREEN) {
            botonSeleccionado.setBackground(Color.RED); // Butaca seleccionada
            JOptionPane.showMessageDialog(this, "Butaca seleccionada: " + botonSeleccionado.getText());
        } else {
            botonSeleccionado.setBackground(Color.GREEN); // Liberar butaca
            JOptionPane.showMessageDialog(this, "Butaca liberada: " + botonSeleccionado.getText());
        }
    }

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(() -> {
            new SeleccionButacas(5, 8).setVisible(true); 
        });
    }
}
