///////////////////////////////
для рендера
///////////////////////////////

flutter build web --web-renderer canvaskit --dart2js-optimization=O3
--dart-define=FLUTTER_WEB_CANVASKIT_URL=canvaskit/

flutter build web --web-renderer canvaskit --dart2js-optimization=O3