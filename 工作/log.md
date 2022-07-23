# 工作总结
## 周一
- [ ] 未知

## 周二
- [ ] 未知

## 周三
- [ ] 未知

## 周四
- [ ] 未知

## 周五
- [ ] 未知


# CRM集群的VPC网络区域
``` sh
curl -X POST -d "item=NEED_SMS_SERVICE&value=false" http:localhost:8080/api/rest/website/external/open/config/update
curl -X POST -d "item=SPECIAL_SMS_CODE&value=7820" http:localhost:8080/api/rest/website/external/open/config/update
curl -X POST -d "smsCode=VIP6868" http:localhost:8080/api/rest/developer/external/open/sms/code

curl 'http:localhost:8080/api/rest/oms/v1/open/system/publicKey' --header 'referer:https:testqacdn.xylink.com/'

curl -v -X POST  \
--header 'Content-Type: application/json' \
-d '{
    "enterpriseId": "9628a48772b6bbc70172bbb559cc0037",
    "startTime": 1657178401000,
    "endTime": 1659856801000,
    "serialNumber": "1657179222011742147",
    "serialSource": "OMS_PRESENT",
    "count": 2,
    "type": 6
}' \
'http:k8s-internal.mid/api/rest/internal/v1/bill/gateway/deposit'

curl http:localhost:8080/api/rest/developer/external/open/image

curl -X POST -F 'name=Jason' -F 'email=jason@example.com' https:example.com/contact.php
```

<pre>
1. getBean() 方法触发 -> 调用doGetBean()
    1.1 转换用户传递name，如果是”&BeanFactoryImplName“，那么beanName=BeanFactoryImplName； 如果是别名的话，会返回最终的实际beanName
    1.2 尝试从一级二级三级缓存中获取beanName对应的bean，找到直接返回
    1.3 检查是否为原型对象，如果是原型对象且还在创建中，直接报错 -> 原型对象不允许有循环依赖
    1.4 一步也是必须要做的，若存在父容器，得看看父容器是否实例化过它了。避免被重复实例化（若父容器被实例化，就以父容器的为准） 【SpringBoot默认单容器】
    1.5 根据beanName名字获取合并过的RootBeanDefinition [❗️❗️❗️-> BeanFactory的beanName就是BeanFactory本身]
    1.6 完成@DependsOn
        1.6.1 检查依赖关系，比如是否a dependsOn b，b depends a，这样的话，两个bean a和b 都无法创建。
        1.6.2 注入新的依赖关系比如a @DependsOn b，注入依赖关系，a依赖b后，还需要去getBean(b)
    1.7 是否为单例
        1.7.1 从一级缓存获取，获取失败，就加入到正在创建的单例BeanName集合中 [❗️❗️❗️ 依赖注入：就需要关注这个正在创建的单例Bean的beanName集合哦]
        1.7.2 开始正式创建对象 [❗️❗️❗️ 创建Bean，很核心哦]
            1.7.2.1  检查是否有@Lookup注解，@Lookup使用场景：比如单例的A，希望每次使用成员B（@Autowrite注入的B）的时候都是一个新的对象，就可以见@Lookup放在成员B上
                     因此需要：为即将生成的Bean，如果这个bean是有lookup和replace方法的话，就需要动态为当前bean生产代理并使用对应的拦截器为bean做增强处理
            1.7.2.2  触发： InstantiationAwareBeanPostProcessor#applyBeanPostProcessorsBeforeInstantiation()，如果中间任意一个方法返回不为null,直接结束调用。
                     上面只要触发成功就接着触发： BeanPostProcessor#postProcessAfterInitialization方法（同样如果任意一次返回不为null,即终止调用。) -> 这个bean就会被直接返回啦
                     【❗️❗️❗️ AbstractAutoProxyCreator 自动代理创建器，是同时InstantiationAwareBeanPostProcessor#applyBeanPostProcessorsBeforeInstantiation()和BeanPostProcessor#postProcessAfterInitialization方法和SmartInstantiationAwareBeanPostProcessor#getEarlyBeanReference()，但实际上applyBeanPostProcessorsBeforeInstantiation()基本无效，因为没有定制的TargetSourceCreator，实际上是在：SmartInstantiationAwareBeanPostProcessor#getEarlyBeanReference()这一步去生成代理对象的哦】
                     【❗️❗️❗️ AbstractSingletonProxyFactoryBean 是通过FactoryBean的方式来创建代理对象的】
            1.7.2.3 只要前两个步骤创建出来了代理bean，就直接返回这个bena【代理bean很少是在这里处理吧❗️❗️❗️】
            1.7.2.4 既然applyBeanPostProcessorsBeforeInstantiation()没有创建Bean，那就自己来doCreateBean()
                a. 实例化当前bean
                    如果设置Supplier回调，则调用obtainFromSupplier()方法进行初始化                              ->  人为提供的实例化策略instanceSupplier
		            如果存在工厂方法，则使用工厂方法进行初始化                                                    -> @Bean标注的方法
		            判断缓存中是否存在构造函数，如果存在，则根据是否使用自动注入，否则去找一个可用的构造器
                        SmartInstantiationAwareBeanPostProcessor#determineCandidateConstructors(..)获取可用的构造器，谁第一个发现一个可用的构造器，就return，否则返回null
                        常用的就是：AutowiredAnnotationBeanPostProcessor#determineCandidateConstructor      -> 构造器依赖注入在这里完成的[对于循环依赖只能报错哦❗️❗️❗️]
		            如果上述条件还是不满足，则使用无参构造方法来创建实例                                           -> 空参构造器构造 【Gclib或Jdk】
                b. 在实例化之后、属性填充之前，对BeanDefinition进行修改操作 ->  MergedBeanDefinitionPostProcessor#postProcessMergedBeanDefinition(..)
                c. 当前bean为单例Bean，且允许循环依赖
                    c.1 那就存入三级缓存中，并且 value 为 () -> getEarlyBeanReference(beanName, mbd, bean)
                    c.2 getEarlyBeanReference(beanName, mbd, bean) -> 一直遍历 SmartInstantiationAwareBeanPostProcessor#getEarlyBeanReference() 将前一个结果作为后一个结果放进去【❗️❗️❗️ 允许去创建一个代理对象，比如 AbstractAutoProxyCreator 就是这个方法创建的哦】
                d. bean实例的属性填充
                    d.1 调用 InstantiationAwareBeanPostProcessor#postProcessAfterInstantiation() -> 实例化之后，属性填充之前的一个时机 -> 只要其中一个返回false，就会导致后续的步骤不在执行哦
                    d.2 调用 InstantiationAwareBeanPostProcessor#postProcessProperties() -> 实例化之后，属性填充之前，修改PropertieValues
                    d.3 如果 InstantiationAwareBeanPostProcessor#postProcessProperties() 返回null -> 就去处理 InstantiationAwareBeanPostProcessor#postProcessPropertyValues() [❗️❗️❗️ 为什么，这里主要是一个兼容，后来的版本加入了postProcessPropertyValues(..)提供了一个PropertyDescriptor属性描述符，想要使用，就必须老版的postProcessProperties(..)返回null哦]
                    d.4 接受经过增强的 PropertyValues 设置到bean的各个属性上去
                e. 初始化bean -> [❗️❗️❗️ 允许返回一个新的代理bean]
                    e.1 实现 BeanNameAware / BeanClassLoaderAware / BeanFactoryAwareAware 接口，注入相关对象
                    e.2 调用 BeanPostProcessor#postProcessBeforeInitialization()  -> 初始化前置处理
                        基本上也是执行Aware接口的注入，比如：
                        InitDestroyAnnotationBeanPostProcessor 
                        ServletContextAwareProcessor 实现感知接口的注入 -> ServletContextAware、ServletConfigAware
                        ApplicationContextAwareProcessor/ServletContextAwareProcessor 实现感知接口的注入 -> 比如EnvironmentAware/EmbeddedValueResolverAware/ResourceLoaderAware/ApplicationEventPublisherAware/MessageSourceAware/ApplicationContextAware
                        BootstrapContextAwareProcessor 实现感知接口的注入 -> BootstrapContextAware
                    e.3 执行初始化方法
                        e.3 实现了initialzingBean，调用实现的 afterPropertiesSet()
                        e.4 配置了init-mothod，调用相应的init()方法
                    e.5 调用 BeanPostProcessor#postProcessAfterInitialization     -> 初始化后置处理【直到一个返回null值结束】
                f. 上面将单例Bean已经存入到三级缓存中 -> 需要验证一下循环依赖问题【❗️❗️❗️】
                    f.1 尝试二级和一级缓存拿到上面的 c.1 中 getEarlyBeanReference(beanName, mbd, bean) 输出的结果 ->  原因： 如果拿到非null结果，说明对象从三级缓存升级到二级缓存，此刻存在循环依赖，因为加入的 () -> getEarlyBeanReference(beanName, mbd, bean) 是加入到三级缓存的，除非a->b,b->a才会导致a升级到二级缓存
                    f.2 然后如何初始化过程中e.5初始化步骤将bean已经做过代理，那么就会导致和 getEarlyBeanReference(beanName, mbd, bean) 中的bean不是同一个，也就是说 bean b 依赖的 bean a 使无效的，需要报错
                g. 注册@PreDestroy、DisposableBean等注销方法 
        1.7.3 没有任何异常，结束单例Bean的创建检查，从上述正在创建的单例BeanName集合中移除其beanName 
        1.7.4 创建单例Bean成功，提升到一级缓存，清空二级三级缓存
    1.8 调用 getObjectForBeanInstance(sharedInstance, name, beanName, mbd) -> sharedInstance 是成功创建的Bean，就下来就需要考虑这个Bean是否为需要的Bean，还是需要FactoryBean里面的getObject的Bean
        1.8.1 用户传递进来的name是”&BeanFactoryName“的形式，表明其需要的就是BeanFactory对象，直接返回出去
        1.8.2 bean本身也不是FactoryBean类型的，直接return -> 因为非FactoryBean无法知道用getObject()
        1.8.2 使用FactoryBean#isSingleton()判断是否单例,并且是否在单例bean容器中缓存起来,没有缓存起来就调用FactoryBean#getObject()并缓存后返回出去 -> 【❗️❗️❗️】
</pre>
