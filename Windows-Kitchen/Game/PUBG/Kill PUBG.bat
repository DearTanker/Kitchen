@echo off

echo 开始清理 PUBG 相关所有进程：
echo ------------------------------------------------

taskkill /f /im TslGame.exe
taskkill /f /im TslGame_BE.exe
taskkill /f /im TslGame_UC.exe
taskkill /f /im TslGame_ZK.exe
taskkill /f /im ExecPubg.exe
taskkill /f /im zksvc.exe
taskkill /f /im iigw_server.exe
taskkill /f /im ucldr_battlegrounds_gl.exe
taskkill /f /im SGuard64.exe
taskkill /f /im SGuardSvc64.exe
taskkill /f /im BEService.exe
taskkill /f /im GameOverlayUI.exe

echo ------------------------------------------------
echo 清理完成，请等待此窗口自动关闭后再运行PUBG。

timeout /nobreak /t 3
