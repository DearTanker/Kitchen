@echo off

echo ��ʼ���� PUBG ������н��̣�
echo ------------------------------------------------

taskkill /f /im BEService.exe
taskkill /f /im GameOverlayUI.exe
taskkill /f /im TslGame.exe
taskkill /f /im TslGame_BE.exe
taskkill /f /im TslGame_UC.exe
taskkill /f /im TslGame_ZK.exe
taskkill /f /im ExecPubg.exe
taskkill /f /im zksvc.exe
taskkill /f /im iigw_server.exe
taskkill /f /im ucldr_battlegrounds_gl.exe

echo ------------------------------------------------
echo ������ɣ���ȴ��˴����Զ��رպ�������PUBG��

timeout /nobreak /t 5
