import NBRenderNode from './NBRenderNode';

export default class NBCanvasRender {
    private _canvas: any;
    private _canvasContext: CanvasRenderingContext2D;
    public get canvasContext(): CanvasRenderingContext2D {
        return this._canvasContext;
    }

    private _lastFrameTime: number;
    public set lastFrameTime(value: number) {
        this._lastFrameTime = value;
    }
    private _drawList: Array<NBRenderNode>;

    constructor(canvas: any) {
        this._canvas = canvas;
        this._canvasContext = canvas.getContext('2d');
        this._drawList = new Array<NBRenderNode>();
        this._lastFrameTime = Date.now() / 1000;

        this._canvasContext.setTransform(1, 0, 0, 1, 0, 0);
        requestAnimationFrame(this.draw.bind(this));
    }

    public pushDrawNode(aNode: NBRenderNode) {
        this._drawList.push(aNode);
    }

    private sortCompareFn(a: NBRenderNode, b: NBRenderNode): number {
        if (a.zIndex == b.zIndex) {
            return 0;
        }
        return a.zIndex < b.zIndex ? 1 : -1;
    }

    private sortDrawList() {
        this._drawList.sort(this.sortCompareFn);
    }

    private onChangeCanvasSize() {
        const w = this._canvas.clientWidth;
        const h = this._canvas.clientHeight;
        if (this._canvas.width != w || this._canvas.height != h) {
            this._canvasContext.translate(-this._canvas.width / 2, -this._canvas.height); //调整原点
            this._canvas.width = w;
            this._canvas.height = h;
            this._canvasContext.translate(w / 2, h / 2); //调整原点
        }
    }

    private draw() {
        const now = Date.now() / 1000;
        const delta = now - this._lastFrameTime;
        this._lastFrameTime = now;

        this._canvasContext.save();
        this._canvasContext.setTransform(1, 0, 0, 1, 0, 0);
        this._canvasContext.clearRect(0, 0, this._canvas.width, this._canvas.height);
        this._canvasContext.fillStyle = '#ccc';
        this._canvasContext.fillRect(0, 0, this._canvas.width, this._canvas.height);
        this._canvasContext.restore();
        this.onChangeCanvasSize();

        this.sortDrawList();
        for (const aNode of this._drawList) {
            aNode.draw(this, delta);
        }
        requestAnimationFrame(this.draw.bind(this));
    }
}
