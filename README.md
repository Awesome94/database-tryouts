# database-tryouts
Practicing some queries.

#Triggers.
DML Triggers.(Data manipulation Language)
    Can be classified into AFTER AND INSTEAD OF Triggers

Event triggers AKA. Global Triggers.

# Stored Procedures.
In postgresql procedural languages such as python PL/PgSQL Perl and Tcl are referred to as stored procedures. The stored procedures add many procedural elements such as control structures, loops and complex calculations to extend SQL-Standard. It allows you to develop complex functions in postgrsQL that may not be possible using plain SQL statements.

Basically stored procedures are used for developing functions in PostgresQL

Procedural languages such as python Perl TCL et al.. allow you to extend the database functionality with user-defined functions. By default postgresql supports  three procedural languages I.e SQL, PLSQL and C. Other procedural languages such as python perl and TCL can be loaded using extensions.

# High Availability.
- Fail over clustering.(instance scope)
    Provides high Availability for an entire instance of SQL Server.
    A combination of one or more nodes.
    Two or more shared disks. clustering does not provide fault tolerance on the hard disk.
    Application does not have to know which node hosts the failover cluster instance.
    A sql Server failover cluster appears on the network as a single computer.

    Pros.
        supports File Stream Data.
        Manual failover
        Transparent client redirect.

    Cons
        Does not provide protection from disk failure.
        Has no reporting on standby.
        Requires significant hardware investment.
        Utilises a single copy of the database.
        Operates at the server instance scope.


- Database Mirroring.(2 server Type Paradigm)
    - Involves a principle database and a mirror database.
    - Mirror database is inaccessible to clients
    - A read only snapshot of the mirror database can be made available.
    - Runs with either synchronous operation(high-safety mode) wait for both changes to commit and before that the client will not get notification that both their changes are complete or asynchronous operation.(high-performance)
    - High safety mode with automatic failover involves a third witness server instance which enables automatic failover.(makes mirror server principle)

    Pros.
        automatic detection and failover
        Manual failover
        Transparent client redirect
        Uses a single duplicate copy of the database.
        Uses Standard servers
        Provides limited reporting.
        Zero Work loss.
        Operates at the database scope.
    Cons
        No support for file stream.

- Log Shipping.
    Similar to Mirroring.
    Operates at a database level.

    Pros
        - supports multiple secondary databases
        - supports file Stream data
        - can adjust time delay for applying logs

    Cons
        - Logfile lag time
        - No automatic fail over
- Replication.
    Does not provide high Availability. i.e its just distributed availability.
    - Can distribute data to one or more secondary servers
    - Enables real-time availability across multiple servers
    - supports filtering and partitioning of data sent to subscribers
    - Allows complete availability of the secondary databases with all functions
Replication works best when combined with Mirroring for high availability
