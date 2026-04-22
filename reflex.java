import java.lang.reflect.Field;

public class Reflex {
    public static void main(String[] args) {
        Class class_p = JDBC_study.class;
        System.out.println(class_p);

        try {
            Field sqlField = class_p.getField("testField");
            System.out.println("字段值：" + sqlField.get(null));
        } catch (NoSuchFieldException e) {
            System.err.println("字段不存在：" + e.getMessage());
        } catch (IllegalAccessException e) {
            System.err.println("访问权限不足：" + e.getMessage());
        }
    }
}
