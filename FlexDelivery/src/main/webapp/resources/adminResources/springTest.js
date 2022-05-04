/*------------------------------*\
|* Springs
\*------------------------------*/

// Formula for updating the wave was taken from
// http://jsfiddle.net/phil_mcc/sXmpD/8/#run
// Also see: https://gamedev.stackexchange.com/a/45247

// Resolution of simulation
const NUM_POINTS = 30;
// Spring constant for forces applied by adjacent points
const SPRING_CONSTANT = 0.004;
// Sprint constant for force applied to baseline
const SPRING_CONSTANT_BASELINE = 0.005;
// Damping to apply to speed changes
const DAMPING = 0.981;
// Draw radius for wave points
const POINT_RADIUS = 4;
// Mass
const POINT_MASS = 0.5;

/*------------------------------*\
|* Main Canvas
\*------------------------------*/

class Canvas {
    constructor() {
        // setup a canvas
        this.canvas = document.getElementById('canvas');
        this.dpr = window.devicePixelRatio || 1;
        // this.dpr = 1;
        
        this.ctx = this.canvas.getContext('2d');
        this.ctx.scale(this.dpr, this.dpr);
    
        this.mouse = {
            x: 0,
            y: 0,
            mousedown: false,
        };
        
        this.setCanvasSize = this.setCanvasSize.bind(this);
        this.handleMousedown = this.handleMousedown.bind(this);
        this.handleMouseup = this.handleMouseup.bind(this);
        this.handleMouse = this.handleMouse.bind(this);
        this.handleClick = this.handleClick.bind(this);
        this.render = this.render.bind(this);
        
        this.setCanvasSize();
        this.setupListeners();
        
        this.constructWave();
        this.triggerWave(this.canvas.width / 2, this.canvas.height);
        
        this.tick = 0;
        this.render();   
    }
    
    constructWave() {
        const padding = 60 * this.dpr;
        const points = NUM_POINTS;

        const y = this.canvas.height / 2;

        const p1 = new Point(
            padding,
            y
        );

        const p2 = new Point(
            this.canvas.width - padding,
            y,
        );

        this.wave = new Wave(points, p1, p2);    
    }
    
    setupListeners() {
        window.addEventListener('resize', this.setCanvasSize);
        window.addEventListener('mousedown', this.handleMousedown);
        window.addEventListener('mouseup', this.handleMouseup);
        window.addEventListener('mousemove', this.handleMouse);
        window.addEventListener('click', this.handleClick);
    }
    
    handleClick(event) {
        // const x = event.clientX * this.dpr;
        // const y = event.clientY * this.dpr;
        // this.mouse.x = x;
        // this.mouse.y = y;
    }
    
    handleMousedown(event) {
        this.mouse.mousedown = true;
    }
    
    handleMouseup(event) {
        this.mouse.mousedown= false;
    }
    
    handleMouse(event) {
        const x = event.clientX * this.dpr;
        const y = event.clientY * this.dpr;
        this.mouse.x = x;
        this.mouse.y = y;
    }
    
    triggerWave(x, y) {
        let closestPoint = {};
        let closestDistance = -1;
        
        const points = this.wave.points;
        let idx = 0;
        
        for (var n = 0; n < points.length; n++) {
            const p = points[n];
            const distance = Math.abs(x - p.x);
            
            if (closestDistance === -1) {
                closestPoint = p;
                closestDistance = distance;
                idx = n;
            } else if (distance <= closestDistance) {
                closestPoint = p;
                closestDistance = distance;
                idx = n;
            }
        }
    
        const halfHeight = this.canvas.height / 2;
        // update the wave point closest to the mouse to start a wave
        
        const dy = y - halfHeight; // delta y from baseline
        
        
        const spread = 4; // number of points to affect from closest point
        const mod = (idx - spread) % points.length; // modulus
        const start = mod < 0 ? points.length + mod : mod; // starting idx accounting for negatives
        const length = spread * 2 + 1; // number of points total 

        let rad = 0; // start radian
        const radInc = Math.PI / length; // radians bases on total length
        
        for (let n = 0; n < length; n++) {
            const i = (start + n) % points.length;
            const point = points[i];
            const pow = Math.sin(rad) * dy + halfHeight; // power determined by delta y from baseline
            point.y = pow;
            rad += radInc;
        }
    }
    
    setCanvasSize() {
        this.canvas.width = window.innerWidth * this.dpr;
        this.canvas.height = window.innerHeight * this.dpr;
        this.canvas.style.width = window.innerWidth + 'px';
        this.canvas.style.height = window.innerHeight + 'px';
        
        this.constructWave();
    }
    
    drawBackground() {
        const gradient = this.ctx.createLinearGradient(0, 0, this.canvas.width, this.canvas.height);
        gradient.addColorStop(0, '#fefefe');
        gradient.addColorStop(1, '#fefefe');
        this.ctx.fillStyle = gradient;
        this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height); 
    }
    
    drawText() {
        const size = this.canvas.width / 10;
        this.ctx.font = `bold ${size}px Futura`;
        this.ctx.textAlign = 'center';
        this.ctx.fillStyle = '#b224ef';
        this.ctx.fillText('Flex Delivery', this.canvas.width / 2, this.canvas.height / 2 - size / 2);
    }
    
    drawCurve() {
        this.ctx.lineCap = 'round';
        this.ctx.lineWidth = 3 * this.dpr;
        this.ctx.strokeStyle = '#b224ef';

        this.ctx.beginPath();
        this.ctx.moveTo(
            this.wave.points[0].x,
            this.wave.points[0].y
        );

        for (let k = 0; k < this.wave.points.length - 1; k++) {

            const p1 = this.wave.points[k];
            const p2 = this.wave.points[k + 1];

            const cpx = (p1.x + p2.x) / 2;
            const cpy = (p1.y + p2.y) / 2;

            if (k === this.wave.points.length - 2) {
                this.ctx.quadraticCurveTo(
                    p1.x,
                    p1.y,
                    p2.x,
                    p2.y
                );
            } else {
                this.ctx.quadraticCurveTo(
                    p1.x,
                    p1.y,
                    cpx,
                    cpy
                );
            }

        }

        this.ctx.stroke();
    }
    
    drawSpring() {
        this.ctx.lineCap = 'round';
        this.ctx.lineJoin= 'round';
        this.ctx.lineWidth = 3 * this.dpr;
        this.ctx.strokeStyle = '#8c6eef';

        for (let k = 0; k < this.wave.points.length; k++) {
            const p1 = this.wave.points[k];
            const p2 = {
                x: p1.x,
                y: this.canvas.height - 60 * this.dpr,
            };
            
            this.ctx.beginPath();
            this.ctx.moveTo(p1.x, p1.y);
            
            const coils = this.canvas.height / 20;
              
            const dy = p2.y - p1.y;
            const dist = dy / coils;
            
            for (let n = 1; n <= coils; n++) {
                const dyn = dist * n;
                let dx = this.canvas.height * 0.004;  
                
                if (n % 2 === 0) {
                    dx *= -1;    
                }
                
                this.ctx.lineTo(p1.x + dx, p1.y + dyn);
            }
            
            this.ctx.stroke();
            this.ctx.closePath();
        }

    }
    
    drawVerts() {
        this.ctx.lineWidth = 2 * this.dpr;
        this.ctx.fillStyle = '#8c6eef';
        this.ctx.strokeStyle = '#009efd';

        this.wave.points.forEach(p => {
            this.ctx.beginPath();
            this.ctx.arc(p.x, p.y, POINT_RADIUS * this.dpr, 0, Math.PI * 2, true);
            this.ctx.closePath();
            this.ctx.fill();    
            this.ctx.stroke();
        });
    }
    
    drawMouse() {
        this.ctx.lineWidth = 2 * this.dpr;
        this.ctx.fillStyle = 'rgba(102, 126, 234, 0.5)';
        this.ctx.strokeStyle = this.mouse.mousedown ? '#330867' : '#89f7fe';

        this.ctx.beginPath();
        this.ctx.arc(this.mouse.x, this.mouse.y, 16 * this.dpr, 0, Math.PI * 2, true);
        this.ctx.closePath();  
        this.ctx.stroke();
        this.mouse.mousedown && this.ctx.fill();
    }

    updateWave() {
        // http://jsfiddle.net/phil_mcc/sXmpD/8/#run
        // https://gamedev.stackexchange.com/a/45247
        
        const points = this.wave.points;
        
		for (var n = 0; n < points.length; n++) {
			const p = points[n];
            
            // force to apply to this point
			let force = 0;

			// forces caused by the point immediately to the left or the right
			let forceFromLeft;
            let forceFromRight;

			if (n == 0) { // wrap to left-to-right
				let dy = points[points.length - 1].y - p.y;
				forceFromLeft = SPRING_CONSTANT * dy;
			} else { // normally
				let dy = points[n - 1].y - p.y;
				forceFromLeft = SPRING_CONSTANT * dy;
			}
			if (n == points.length - 1) { // wrap to right-to-left
				let dy = points[0].y - p.y;
				forceFromRight = SPRING_CONSTANT * dy;
			} else { // normally
				let dy = points[n + 1].y - p.y;
				forceFromRight = SPRING_CONSTANT * dy;
			}

			// Also apply force toward the baseline
			let dy = this.canvas.height / 2 - p.y;
			const forceToBaseline = SPRING_CONSTANT_BASELINE * dy;
            
			// Sum up forces
			force = force + forceFromLeft;
			force = force + forceFromRight;
			force = force + forceToBaseline;

			// Calculate acceleration
			const acceleration = force / p.mass;
     

			// Apply acceleration (with damping)
			p.vy = DAMPING * p.vy + acceleration;

			// Apply speed
			p.y = p.y + p.vy;
        }
    }
    
    render() {
        this.drawBackground();
        this.drawText();
        // this.drawCurve();
        this.drawSpring();
        this.drawVerts();
        this.drawMouse();
        
        this.updateWave();
        
        // Hold on mousedown
        if (this.mouse.mousedown) {
            const { x, y } = this.mouse;
            this.triggerWave(x, y);
        }

        this.tick++;

        window.requestAnimationFrame(this.render);
    }
}

/*------------------------------*\
|* Wave
\*------------------------------*/

class Wave {
    constructor(points, p1, p2) {
        this.p1 = p1;
        this.p2 = p2;
        
        const dx = p2.x - p1.x;
        const dy = p2.y - p1.y;
        
        const vx = dx / (points - 1);
        const vy = dy / (points - 1);

        this.points = new Array(points)
            .fill(null)
            .map((p, i) => new Point(
                p1.x + vx * i,
                p1.y + vy * i
            )
        );
    }  
}

/*------------------------------*\
|* Point
\*------------------------------*/

class Point {
    constructor(x = 0, y = 0) {
        this.x = x;
        this.y = y;
        
        this.vy = 0;
        this.vx = 0;

        this.mass = POINT_MASS;
    }
    
    get position() {
        return {
            x: this.x,
            y: this.y,
        };
    }
    
    moveTo(...args) {
        this.x = args[0];
        this.y = args[1];
    }
}

new Canvas();