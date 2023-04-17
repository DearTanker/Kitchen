chown all things to www.www

```
chown -R www.www ./
```

chmod all directory to 755 files to 644

```
find ./ -type f -print |xargs chmod 644
find ./ -type d -print|xargs chmod 755
```
