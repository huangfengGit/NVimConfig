import NBCanvas from './NBCanvasRender';
import NBRenderNode from './NBRenderNode';

export default class NBSprite extends NBRenderNode {
    private _img: HTMLImageElement;
    private _isLoadDone: boolean = false;

    private _url: string = '';
    public get url(): string {
        return this._url;
    }
    public set url(value: string) {
        if (value != this._url) {
            this._isLoadDone = false;
            this._img.src = value;
            this._url = value;
        }
    }

    constructor(url: string) {
        super();
        this._img = new Image();
        this._img.onload = () => {
            this._isLoadDone = true;
        };
        this._img.src = url;
    }

    public draw(canvas: NBCanvas, delta: number): void {
        if (this._isLoadDone) {
            this._img;
            canvas.canvasContext.drawImage(
                this._img,
                -this._img.width * 0.5,
                -this._img.height * 0.5,
                this._img.width,
                this._img.height
            );
        }
    }
}
