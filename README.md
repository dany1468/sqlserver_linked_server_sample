# SQL Server Linked Server Sample

SQL Server 2017 での Linked Server のサンプルです。

## 起動

```bash
% docker-compose up -d
```

上記が終了した時点で `db` から `linked-db` に対して Linked Server の設定が終わっています。

- `db`
    - `main` database
        - `dbo.Orders` table
- `linked-db`
    - `shared` database
        - `dbo.Customers` table

## 確認

```bash
% docker-compose exec db /bin/bash
# 以下はコンテナ内
# /opt/mssql-tools/bin/sqlcmd -U SA -P P@55w0rd -d main -q "SELECT * FROM dbo.Orders o INNER JOIN [linked-db].[shared].dbo.Customers c ON o.CustomerId = c.Id"
Id          OrderDate               CustomerId  Id          Name
----------- ----------------------- ----------- ----------- --------------------------------------------------
          1 2019-10-11 07:09:41.590           1           1 taro
          2 2019-10-11 07:09:41.590           2           2 jiro
          3 2019-10-11 07:09:41.590           3           3 saburo
```

db インスタンスには存在しない `dbo.Customers` のデータが `INNER JOIN` できている事が確認できます。