## start your awesome project

## 项目组织方式

### Spring Boot 项目的目录结构

* module (业务模块包)
  + controller (控制器类包)
  + domain (问题模型包)
    - entity (实体类包)
    - repo (仓库类包)
  + service (服务类包)
    - impl (服务实现类包)

下面是一个项目中代码组织结构示例

```text
src\main\java\com\avic\mti\skree\user
+---controller
|       DepartmentController.java
|       EmployeeController.java
|
+---domain
|   +---entity
|   |       Department.java
|   |       Employee.java
|   |
|   \---repo
|           DepartmentRepository.java
|           EmployeeRepository.java
|
\---service
    |   DepartmentService.java
    |   EmployeeService.java
    |
    \---impl
            DepartmentServiceImpl.java
            EmployeeServiceImpl.java
```

### Spring Boot 文档的目录结构

* module
  + readme.md
  + base (基础 URI 的名字)
    - readme.md
    - {get|post|put|delete}FunctionName.md (控制器函数名称)
