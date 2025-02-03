package com.draaisa.controller;

import com.draaisa.database.DatabaseConnection;
import com.draaisa.model.Categoria;
import com.draaisa.model.Proveedor;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ProveedorController {

    // Método para registrar proveedor desde formulario
    public void registrarProveedor(Proveedor proveedor, List<Categoria> categorias) {
        String sqlProveedor = "INSERT INTO proveedor (nombreprov, cpProveedor, noExtProv, noIntProv, rfcProveedor, municipio, estado, calle, colonia, ciudad, pais, telefonoProv, correoProv, curpproveedor, pfisicaproveedor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING idProveedor";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmtProveedor = conn.prepareStatement(sqlProveedor,
                        Statement.RETURN_GENERATED_KEYS)) {

            stmtProveedor.setString(1, proveedor.getNombreProv());
            stmtProveedor.setInt(2, proveedor.getCpProveedor());
            stmtProveedor.setInt(3, proveedor.getNoExtProv());
            stmtProveedor.setInt(4, proveedor.getNoIntProv());
            stmtProveedor.setString(5, proveedor.getRfcProveedor());
            stmtProveedor.setString(6, proveedor.getMunicipio());
            stmtProveedor.setString(7, proveedor.getEstado());
            stmtProveedor.setString(8, proveedor.getCalle());
            stmtProveedor.setString(9, proveedor.getColonia());
            stmtProveedor.setString(10, proveedor.getCiudad());
            stmtProveedor.setString(11, proveedor.getPais());
            stmtProveedor.setString(12, proveedor.getTelefonoProv());
            stmtProveedor.setString(13, proveedor.getCorreoProv());
            stmtProveedor.setString(14, proveedor.getCurp());
            stmtProveedor.setBoolean(15, proveedor.isEsPersonaFisica());
            stmtProveedor.executeUpdate();

            ResultSet generatedKeys = stmtProveedor.getGeneratedKeys();
            int idProveedor = -1;
            if (generatedKeys.next()) {
                idProveedor = generatedKeys.getInt(1);
            }

            for (Categoria categoria : categorias) {
                int idCategoria = obtenerOCrearCategoria(categoria);
                asociarProveedorConCategoria(idProveedor, idCategoria);
            }

            System.out.println("Proveedor registrado exitosamente.");

        } catch (SQLException | IOException e) {
            e.printStackTrace();
            System.out.println("Error al registrar proveedor.");
        }
    }

    // Método para obtener o registrar una categoría
    private int obtenerOCrearCategoria(Categoria categoria) throws SQLException, IOException {
        String sqlObtenerId = "SELECT idCategoria FROM categoria WHERE nombreCategoria = ?";
        String sqlInsertCategoria = "INSERT INTO categoria (nombrecategoria, desccategoria) VALUES (?, ?) ON CONFLICT (nombrecategoria) DO NOTHING RETURNING idcategoria";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmtObtenerId = conn.prepareStatement(sqlObtenerId);
                PreparedStatement stmtInsertCategoria = conn.prepareStatement(sqlInsertCategoria)) {

            // Verificar si la categoría ya existe
            stmtObtenerId.setString(1, categoria.getNombreCategoria());
            ResultSet rs = stmtObtenerId.executeQuery();
            if (rs.next()) {
                return rs.getInt("idCategoria");
            }

            // Si no existe, insertarla
            stmtInsertCategoria.setString(1, categoria.getNombreCategoria());
            stmtInsertCategoria.setString(2, categoria.getDescripcionCategoria());
            ResultSet generatedKeys = stmtInsertCategoria.executeQuery();
            if (generatedKeys.next()) {
                return generatedKeys.getInt("idCategoria");
            }
        }
        return -1;
    }

    // Método para asociar proveedor con categoría
    private void asociarProveedorConCategoria(int idProveedor, int idCategoria) throws SQLException, IOException {
        String sql = "INSERT INTO proveedorcategoria (idproveedor, idcategoria) VALUES (?, ?) ON CONFLICT DO NOTHING";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProveedor);
            stmt.setInt(2, idCategoria);
            stmt.executeUpdate();
        }
    }

    // Método para modificar un proveedor
    public void modificarProveedor(Proveedor proveedor) {
        String sql = "UPDATE proveedor SET nombreprov = ?, cpproveedor = ?, noExtProv = ?, noIntProv = ?, rfcProveedor = ?, municipio = ?, estado = ?, calle = ?, colonia = ?, ciudad = ?, pais = ?, telefonoProv = ?, correoprov = ?, curpproveedor = ?, pfisicaproveedor = ? WHERE idproveedor = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, proveedor.getNombreProv());
            stmt.setInt(2, proveedor.getCpProveedor());
            stmt.setInt(3, proveedor.getNoExtProv());
            stmt.setInt(4, proveedor.getNoIntProv());
            stmt.setString(5, proveedor.getRfcProveedor());
            stmt.setString(6, proveedor.getMunicipio());
            stmt.setString(7, proveedor.getEstado());
            stmt.setString(8, proveedor.getCalle());
            stmt.setString(9, proveedor.getColonia());
            stmt.setString(10, proveedor.getCiudad());
            stmt.setString(11, proveedor.getPais());
            stmt.setString(12, proveedor.getTelefonoProv());
            stmt.setString(13, proveedor.getCorreoProv());
            stmt.setString(14, proveedor.getCurp());
            stmt.setBoolean(15, proveedor.isEsPersonaFisica());
            stmt.setInt(16, proveedor.getIdProveedor());
            stmt.executeUpdate();

            System.out.println("Proveedor actualizado correctamente.");
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            System.out.println("Error al modificar proveedor.");
        }
    }

    public List<Proveedor> buscarProveedores(String filtro) {
        List<Proveedor> proveedores = new ArrayList<>();
        String[] filtros = filtro.split(","); // Separar por comas

        // Crear condiciones dinámicas para la búsqueda de proveedores
        StringBuilder sql = new StringBuilder("SELECT p.* FROM proveedor p WHERE ");
        List<String> condiciones = new ArrayList<>();

        // Condiciones de búsqueda por cada filtro
        for (String palabra : filtros) {
            palabra = palabra.trim();

            if (palabra.matches("\\d+")) { // Filtrar por ID
                condiciones.add("p.idProveedor = ?");
            } else if (palabra.matches("[a-zA-Z]+")) { // Filtrar por categoría
                condiciones.add(
                        "p.idProveedor IN (SELECT pc.idProveedor FROM proveedorcategoria pc INNER JOIN categoria c ON pc.idCategoria = c.idCategoria WHERE c.nombreCategoria ILIKE ?)");
            } else if (palabra.matches("\\d{10}")) { // Filtrar por teléfono
                condiciones.add("p.telefonoProv = ?");
            } else if (palabra.matches("[A-Za-z0-9]{13}")) { // Filtrar por RFC
                condiciones.add("p.rfcProveedor = ?");
            } else {
                // Filtrar por nombre, estado, municipio
                condiciones.add(
                        "p.nombreprov ILIKE ? OR p.estado ILIKE ? OR p.municipio ILIKE ? OR p.rfcProveedor ILIKE ?");
            }
        }

        // Si no hay filtros, traer todos los proveedores
        if (condiciones.isEmpty()) {
            sql.append("1=1"); // Agregar condición que siempre es verdadera
        } else {
            // Unir las condiciones con 'OR' si hay filtros
            sql.append(String.join(" OR ", condiciones));
        }

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int index = 1;
            for (String palabra : filtros) {
                palabra = palabra.trim();

                if (palabra.matches("\\d+")) {
                    stmt.setInt(index++, Integer.parseInt(palabra)); // Filtrar por ID
                } else if (palabra.matches("[a-zA-Z]+")) {
                    stmt.setString(index++, "%" + palabra + "%"); // Filtrar por categoría
                } else if (palabra.matches("\\d{10}")) {
                    stmt.setString(index++, palabra); // Filtrar por teléfono
                } else if (palabra.matches("[A-Za-z0-9]{13}")) {
                    stmt.setString(index++, palabra); // Filtrar por RFC
                } else {
                    // Filtrar por nombre, estado, municipio
                    stmt.setString(index++, "%" + palabra + "%");
                    stmt.setString(index++, "%" + palabra + "%");
                    stmt.setString(index++, "%" + palabra + "%");
                    stmt.setString(index++, "%" + palabra + "%");
                }
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Proveedor proveedor = new Proveedor(
                        rs.getInt("idProveedor"),
                        rs.getString("nombreProv"),
                        rs.getInt("cpProveedor"),
                        rs.getInt("noExtProv"),
                        rs.getInt("noIntProv"),
                        rs.getString("rfcProveedor"),
                        rs.getString("municipio"),
                        rs.getString("estado"),
                        rs.getString("calle"),
                        rs.getString("colonia"),
                        rs.getString("ciudad"),
                        rs.getString("pais"),
                        rs.getString("telefonoProv"),
                        rs.getString("correoProv"),
                        rs.getString("curpproveedor"),
                        rs.getBoolean("pfisicaproveedor"));

                // Inicializar lista de categorías vacía
                List<Categoria> categorias = new ArrayList<>();

                // Consulta para obtener las categorías asociadas al proveedor
                String categoriaSql = """
                        SELECT c.idCategoria, c.nombreCategoria
                        FROM categoria c
                        INNER JOIN proveedorcategoria pc ON c.idCategoria = pc.idCategoria
                        WHERE pc.idProveedor = ?""";

                try (PreparedStatement stmtCategorias = conn.prepareStatement(categoriaSql)) {
                    stmtCategorias.setInt(1, proveedor.getIdProveedor());
                    ResultSet rsCategorias = stmtCategorias.executeQuery();

                    while (rsCategorias.next()) {
                        int idCat = rsCategorias.getInt("idCategoria");
                        String nombreCat = rsCategorias.getString("nombreCategoria");
                        Categoria categoria = new Categoria(idCat, nombreCat);
                        categorias.add(categoria);
                    }
                }

                // Asignar categorías solo si se encontraron
                if (!categorias.isEmpty()) {
                    proveedor.setCategorias(categorias);
                }

                // Agregar proveedor a la lista
                proveedores.add(proveedor);
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return proveedores;
    }

    // Método para eliminar proveedor
    public void eliminarProveedor(int idProveedor) {
        String sqlEliminarCategoria = "DELETE FROM proveedorcategoria WHERE idproveedor = ?";
        String sqlEliminarProveedor = "DELETE FROM proveedor WHERE idProveedor = ?";

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Iniciar una transacción
            conn.setAutoCommit(false);

            try (PreparedStatement stmtCategoria = conn.prepareStatement(sqlEliminarCategoria);
                    PreparedStatement stmtProveedor = conn.prepareStatement(sqlEliminarProveedor)) {

                // Eliminar las categorías asociadas con el proveedor
                stmtCategoria.setInt(1, idProveedor);
                stmtCategoria.executeUpdate();

                // Eliminar el proveedor
                stmtProveedor.setInt(1, idProveedor);
                stmtProveedor.executeUpdate();

                // Si todo va bien, confirmar la transacción
                conn.commit();
                System.out.println("Proveedor y su categoría eliminados exitosamente.");
            } catch (SQLException e) {
                // Si ocurre un error, deshacer la transacción
                conn.rollback();
                e.printStackTrace();
                System.out.println("Error al eliminar proveedor y su categoría.");
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            System.out.println("Error al eliminar proveedor.");
        }
    }

    // Método para consultar todos los proveedores
    public List<Proveedor> consultarTodosProveedores() {
        List<Proveedor> proveedores = new ArrayList<>();
        String sql = "SELECT * FROM proveedor";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            Map<Integer, Proveedor> proveedoresMap = new HashMap<>(); // Usar un mapa para evitar duplicados

            while (rs.next()) {
                // Crear proveedor
                Proveedor proveedor = new Proveedor(
                        rs.getInt("idProveedor"),
                        rs.getString("nombreProv"),
                        rs.getInt("cpProveedor"),
                        rs.getInt("noExtProv"),
                        rs.getInt("noIntProv"),
                        rs.getString("rfcProveedor"),
                        rs.getString("municipio"),
                        rs.getString("estado"),
                        rs.getString("calle"),
                        rs.getString("colonia"),
                        rs.getString("ciudad"),
                        rs.getString("pais"),
                        rs.getString("telefonoProv"),
                        rs.getString("correoProv"),
                        rs.getString("curpproveedor"),
                        rs.getBoolean("pfisicaproveedor"));

                // Si el proveedor ya está en el mapa, usamos el existente y agregamos las
                // categorías
                Proveedor existingProveedor = proveedoresMap.get(proveedor.getIdProveedor());
                if (existingProveedor == null) {
                    proveedoresMap.put(proveedor.getIdProveedor(), proveedor);
                } else {
                    proveedor = existingProveedor; // Usar el proveedor existente
                }

                // Consulta para obtener las categorías asociadas al proveedor
                String categoriaSql = """
                        SELECT c.idCategoria, c.nombreCategoria
                        FROM categoria c
                        INNER JOIN proveedorcategoria pc ON c.idCategoria = pc.idCategoria
                        WHERE pc.idProveedor = ?""";

                try (PreparedStatement stmtCategorias = conn.prepareStatement(categoriaSql)) {
                    stmtCategorias.setInt(1, proveedor.getIdProveedor());
                    ResultSet rsCategorias = stmtCategorias.executeQuery();

                    List<Categoria> categorias = new ArrayList<>();
                    while (rsCategorias.next()) {
                        int idCat = rsCategorias.getInt("idCategoria");
                        String nombreCat = rsCategorias.getString("nombreCategoria");
                        categorias.add(new Categoria(idCat, nombreCat));
                    }

                    if (!categorias.isEmpty()) {
                        proveedor.setCategorias(categorias); // Usar lista de categorías
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }

            // Convertir el mapa a una lista de proveedores sin duplicados
            proveedores.addAll(proveedoresMap.values());

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return proveedores;
    }

    // Método para registrar proveedor desde archivo Excel
    public void registrarProveedorDesdeExcel(File excelFile) {
        try (FileInputStream fis = new FileInputStream(excelFile);
                Workbook workbook = new XSSFWorkbook(fis)) {

            Sheet sheet = workbook.getSheetAt(0);
            for (Row row : sheet) {
                if (row.getRowNum() == 0)
                    continue;

                try {
                    // Usar el método obtenerValorCelda para obtener los valores de las celdas
                    String nombre = getStringCellValue(row.getCell(0));
                    String cp = getStringCellValue(row.getCell(1));
                    String noExt = getStringCellValue(row.getCell(2));
                    String noInt = getStringCellValue(row.getCell(3));
                    String rfc = getStringCellValue(row.getCell(4));
                    String municipio = getStringCellValue(row.getCell(5));
                    String estado = getStringCellValue(row.getCell(6));
                    String calle = getStringCellValue(row.getCell(7));
                    String colonia = getStringCellValue(row.getCell(8));
                    String ciudad = getStringCellValue(row.getCell(9));
                    String pais = getStringCellValue(row.getCell(10));
                    String telefono = getStringCellValue(row.getCell(11));
                    String correo = getStringCellValue(row.getCell(12));
                    String curp = getStringCellValue(row.getCell(13));
                    boolean esFisica = Boolean.parseBoolean(getStringCellValue(row.getCell(14)));

                    Proveedor proveedor = new Proveedor(0, nombre, Integer.parseInt(cp), Integer.parseInt(noExt),
                            Integer.parseInt(noInt), rfc, municipio, estado, calle, colonia, ciudad, pais, telefono,
                            correo, curp, esFisica);

                    List<Categoria> categorias = new ArrayList<>();
                    for (int i = 15; i < row.getLastCellNum(); i++) {
                        Cell cell = row.getCell(i, Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                        if (cell != null && cell.getCellType() == CellType.STRING) {
                            String categoriaNombre = getStringCellValue(cell).trim();
                            if (!categoriaNombre.isEmpty()) {
                                // Directamente se agrega la categoría sin obtener el ID
                                categorias.add(new Categoria(0, categoriaNombre, "Descripción de " + categoriaNombre));
                                System.out.println("Categoría " + categoriaNombre + " registrada.");
                            }
                        }
                    }

                    // Ahora solo llamas al método registrarProveedor una sola vez
                    registrarProveedor(proveedor, categorias);

                } catch (Exception e) {
                    System.out.println("Error procesando fila " + row.getRowNum() + ": " + e.getMessage());
                    e.printStackTrace();
                }
            }
            System.out.println("Proveedores registrados desde el archivo Excel.");

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al leer el archivo Excel.");
        }
    }

    private String getStringCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                return String.valueOf((int) cell.getNumericCellValue());
            case BLANK:
                return "";
            default:
                return "";
        }
    }

}
