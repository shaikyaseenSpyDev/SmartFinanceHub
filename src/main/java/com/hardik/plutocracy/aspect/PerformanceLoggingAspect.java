package com.hardik.plutocracy.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * Performance monitoring aspect to log execution time of methods
 * Added by SpyDev for performance optimization
 */
@Aspect
@Component
public class PerformanceLoggingAspect {

    private static final Logger logger = LoggerFactory.getLogger(PerformanceLoggingAspect.class);

    @Pointcut("execution(* com.hardik.plutocracy.service..*.*(..))")
    public void serviceMethods() {
    }

    @Pointcut("execution(* com.hardik.plutocracy.repository..*.*(..))")
    public void repositoryMethods() {
    }

    @Pointcut("execution(* com.hardik.plutocracy.controller..*.*(..))")
    public void controllerMethods() {
    }

    @Around("serviceMethods() || repositoryMethods() || controllerMethods()")
    public Object measureMethodExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        String className = methodSignature.getDeclaringType().getSimpleName();
        String methodName = methodSignature.getName();

        long startTime = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        long executionTime = System.currentTimeMillis() - startTime;

        // Log slow methods (taking more than 100ms)
        if (executionTime > 100) {
            logger.warn("SLOW EXECUTION: {}.{} took {}ms to execute", className, methodName, executionTime);
        } else if (logger.isDebugEnabled()) {
            logger.debug("{}.{} took {}ms to execute", className, methodName, executionTime);
        }

        return result;
    }
}
