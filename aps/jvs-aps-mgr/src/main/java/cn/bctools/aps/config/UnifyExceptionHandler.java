package cn.bctools.aps.config;

import cn.bctools.common.exception.BusinessException;
import cn.bctools.common.utils.ObjectNull;
import cn.bctools.common.utils.R;
import cn.bctools.common.utils.SpringContextUtil;
import cn.bctools.common.utils.StackTraceElementUtils;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.stream.Collectors;

/**
 * 所有的异常服务使用中统一拦截进行统一返回处理，避免返回结果出现任何非正常的错误返回，此统一异常为服务端进行控制，还会在网关层进行再一次的处理，保证所有的结果返回统一化
 * 统一异常处理
 *
 * @author My_gj
 */
@Slf4j
@Data
@ControllerAdvice
@Configuration
public class UnifyExceptionHandler {

    /**
     * 所有非正常结果的异常捕获，{@linkplain Exception} 此层异常数据会最严重的，说明业务中并未处理到此层业务的异常信息,需要在业务层或日志层面做业务异常通知
     *
     * @param e {@linkplain Exception} 异常类对象
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public R exceptionHandler(HttpServletRequest request, Exception e) {
        String s = StackTraceElementUtils.logThrowableToString(e);
        //直接打印堆栈信息
        log.error("系统严重错误,{},{}", request.getRequestURI(), s);
        String msg = e.getMessage();
        if (e instanceof BindException) {
            msg = ((BindException) (e)).getBindingResult().getFieldErrors().stream()
                    .map(v -> SpringContextUtil.msg(v.getDefaultMessage())).collect(Collectors.joining(","));
        } else if (e instanceof NullPointerException) {
            msg = SpringContextUtil.msg("系统异常");
        } else if (ObjectNull.isNull(msg)) {
            msg = SpringContextUtil.msg("系统异常");
        }


        return R.failed(msg);
    }

    /**
     * 下游服务异常
     */
    @ResponseBody
    @ExceptionHandler(value = RuntimeException.class)
    public R runtimeException(HttpServletRequest request, RuntimeException e) {
        //直接打印堆栈信息
        log.error("服务异常", e);
        if (e instanceof BusinessException) {
            BusinessException ex = (BusinessException) e;
            return R.failed(e.getMessage()).setCode(ex.getCode());
        } else if (e.getCause() instanceof BusinessException) {
            BusinessException ex = (BusinessException) e.getCause();
            return R.failed(e.getMessage()).setCode(ex.getCode());
        } else {
            //直接做为通用异常处理
            return exceptionHandler(request, e);
        }
    }

}
