## Design And Architectural Pattern Fundamentals
1. When considering programming questions, it's essential to think about the broader context in which they exist.
1. As developers, we often encounter recurring problems. To solve these efficiently, we use predefined approaches known as design patterns.
1. What are the benefits of using design patterns?
    - Simplifies maintenance
    - Enhances documentation
    - Improves readability
    - Makes it easier to find and define objects
    - Helps determine the appropriate level of detail for objects
    - Facilitates the implementation of large-scale software projects
    - Promotes code reusability
1. What is the best way to learn **Design Patterns**?
    - Study real-world examples
    - Practice by implementing them in projects
    - Understand the problems they solve and the contexts they are used in
1. What are the key elements for design patterns?
    - **Name**: A term to describe the pattern
    - **Problem**: The specific situation where the pattern is applicable
    - **Solution**: The arrangement of elements and their relationships to solve the problem
    - **Consequences**: The results and trade-offs of applying the pattern
1. What are the categories of Design Patterns?

Categories of Design Patterns:

- **Creational**: Concerned with object creation mechanisms
- **Structural**: Deal with object composition
- **Behavioral**: Focus on object interaction and responsibility distribution

7. What is creational pattern?

Creational patterns are used to abstract the instantiation process. They help make a system independent of how its objects are created, composed, and represented.

8. What are the features of creational pattern?

- **Generic Instantiation**: Allows object creation without specifying the exact class (e.g., Abstract Factory, Factory Method)
- **Simplicity**: Simplifies the object creation process (e.g., Builder, Prototype)
- **Creation Constraints**: Controls how and when objects are created (e.g., Singleton)

9. What are the most commonly used design pattern falls under creational pattern?

The following patterns are called creational patterns:
- Abstract Factory
- Factory Method
- Builder
- Prototype
- Singleton

10. What is the key feature of **structural pattern**?

Structural patterns simplify relationships between entities, facilitating communication and collaboration.

11. Provide some examples of structural design patterns.

**Examples of Structural patterns:**

- **Composite**: Composes objects into tree structures to represent part-whole hierarchies. Allows treating individual objects and compositions uniformly.
- **Decorator**: Adds responsibilities to objects dynamically, offering a flexible alternative to subclassing for extending functionality.
- **Flyweight**: Reduces the cost of creating and manipulating a large number of similar objects by sharing common parts.
- **Adapter**: Converts the interface of a class into another interface clients expect, enabling classes to work together despite incompatible interfaces.
- **Facade**: Provides a simplified interface to a complex subsystem, making it easier to use.
- **Proxy**: Acts as a substitute for another object to control access to it.
- **Bridge**: Separates an abstraction from its implementation, allowing them to vary independently.

12. What is Behavioral Pattern?

Behavioral patterns are concerned with communication between objects. They define how objects interact and share responsibilities.

13. What are the examples of Behavioral pattern?

Examples of Behavioral Patterns:

- **Observer**: Defines a one-to-many dependency so that when one object changes state, all its dependents are notified and updated automatically.
- **Strategy**: Defines a family of algorithms, encapsulates each one, and makes them interchangeable. Strategy lets the algorithm vary independently from the clients that use it.
- **Command**: Encapsulates a request as an object, thereby allowing parameterization of clients with queues, requests, and operations.
- **Mediator**: Defines an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by preventing objects from referring to each other explicitly.
- **Memento**: Provides the ability to restore an object to its previous state without revealing its implementation.
- **State**: Allows an object to alter its behavior when its internal state changes, appearing to change the object's class.
- **Template Method**: Defines the skeleton of an algorithm, deferring some steps to subclasses. It lets subclasses redefine certain steps of an algorithm without changing its structure.

14. Explain how the builder pattern works for `Illuminate\Auth\AuthManager` in core Laravel project.

The Builder pattern is a creational design pattern used to construct complex objects step by step. It separates the construction of a complex object from its representation, allowing the same construction process to create different representations.

In the context of the Laravel framework, `Illuminate\Auth\AuthManager` is a good example of where the Builder pattern is used. Here’s how it works in Laravel’s AuthManager:

**Understanding `Illuminate\Auth\AuthManager`**

`Illuminate\Auth\AuthManager` is responsible for managing authentication drivers in Laravel. It provides a way to manage multiple authentication mechanisms, such as session-based, token-based, or custom drivers. The Builder pattern is used to configure and create these authentication drivers.

**How the Builder Pattern is Applied**

- **Director**: The `AuthManager` acts as the director that controls the construction process of the authentication drivers.
- **Builder**: The configuration and creation of the authentication drivers are encapsulated in separate classes that follow a common interface.
- **Product**: The authentication driver instances are the final products created by the builder.

**Implementation Steps**

1. **Define the Driver Configuration**:
The AuthManager defines methods to configure the authentication drivers. It uses configuration settings provided in config/auth.php.

```php
<?php
// config/auth.php
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],
    'api' => [
        'driver' => 'token',
        'provider' => 'users',
        'hash' => false,
    ],
],
```

2. **`AuthManager` Class**:

The `AuthManager` class has a method to resolve and create the authentication drivers based on the configuration.

```php
<?php
namespace Illuminate\Auth;

use InvalidArgumentException;

class AuthManager extends Manager
{
    public function resolve($name)
    {
        $config = $this->getConfig($name);

        if (is_null($config)) {
            throw new InvalidArgumentException("Auth guard [{$name}] is not defined.");
        }

        if (isset($this->customCreators[$config['driver']])) {
            return $this->callCustomCreator($config);
        }

        $driverMethod = 'create' . ucfirst($config['driver']) . 'Driver';

        if (method_exists($this, $driverMethod)) {
            return $this->{$driverMethod}($config);
        }

        throw new InvalidArgumentException("Auth driver [{$config['driver']}] for guard [{$name}] is not defined.");
    }
}

```

3. **Creating Drivers**:

The **AuthManager** class has specific methods to create different types of authentication drivers. These methods act as the builders.

```php
<?php
namespace Illuminate\Auth;

class AuthManager extends Manager
{
    protected function createSessionDriver($config)
    {
        $provider = $this->createUserProvider($config['provider']);

        return new SessionGuard($this->app['session.store'], $provider);
    }

    protected function createTokenDriver($config)
    {
        $provider = $this->createUserProvider($config['provider']);

        return new TokenGuard(
            $this->app['request'],
            $provider,
            $config['hash'] ?? false
        );
    }

    // Additional driver creation methods...
}

```

4. **User Providers**:

The `createUserProvider` method is responsible for creating user providers, which are part of the authentication driver creation process.

```php
<?php
namespace Illuminate\Auth;

use InvalidArgumentException;

class AuthManager extends Manager
{
    protected function createUserProvider($provider)
    {
        $config = $this->app['config']['auth.providers'][$provider];

        if (is_null($config)) {
            throw new InvalidArgumentException("Authentication user provider [{$provider}] is not defined.");
        }

        switch ($config['driver']) {
            case 'database':
                return $this->createDatabaseProvider($config);
            case 'eloquent':
                return $this->createEloquentProvider($config);
            default:
                throw new InvalidArgumentException("Authentication user provider [{$config['driver']}] is not defined.");
        }
    }

    protected function createDatabaseProvider($config)
    {
        $connection = $this->app['db']->connection($config['connection'] ?? null);

        return new DatabaseUserProvider($connection, $this->app['hash'], $config['table']);
    }

    protected function createEloquentProvider($config)
    {
        return new EloquentUserProvider($this->app['hash'], $config['model']);
    }

    // Additional provider creation methods...
}
```

So, in summary the builder pattern in `Illuminate\Auth\AuthManager` allows Laravel to construct complex authentication driver objects step by step. The `AuthManager` class acts as the director, guiding the creation process. Each method in `AuthManager` that creates a driver or a user provider acts as a builder, encapsulating the creation logic and allowing Laravel to manage various authentication mechanisms in a flexible and maintainable way. This approach ensures that adding new drivers or modifying existing ones is straightforward and does not affect the overall structure of the authentication system.
