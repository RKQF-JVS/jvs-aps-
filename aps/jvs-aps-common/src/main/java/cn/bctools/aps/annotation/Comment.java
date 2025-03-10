package cn.bctools.aps.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author jvs
 * 用以添加描述
 */
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Comment {
    /**
     * 描述
     */
    String value();

    /**
     * 详细描述
     */
    String notes() default "";
}
