NBAssetMgr.resPath = 'https://lb-public.oss-cn-shenzhen.aliyuncs.com/static/';
nbCanvas = new NBCanvasRender(document.getElementById('canvas'));
nbSpine_1 = new NBSpine(nbCanvas, 'spineboy-ess');
nbSpine_1.playAnima('walk', true).then(() => {
nbSpine_1.spSkeleton.scaleX = 0.5;
nbSpine_1.spSkeleton.scaleY = -0.5;
nbSpine_1.spSkeleton.y = 200;
nbCanvas.pushDrawNode(nbSpine_1);
});
let aSprite: NBSprite = new NBSprite('http://192.168.10.113:8081/bg.jpg');
nbCanvas.pushDrawNode(aSprite);
