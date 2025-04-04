#[repr(C)]
#[derive(Debug)]
pub struct Point {
    x: f64,
    y: f64,
}

impl Point {
    #[unsafe(no_mangle)]
    pub extern "C" fn new_point(x: f64, y: f64) -> Box<Point> {
        Box::new(Point { x, y })
    }

    #[unsafe(no_mangle)]
    pub extern "C" fn point_length(&self) -> f64 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }

    #[unsafe(no_mangle)]
    pub extern "C" fn print_point(&self) {
        println!("{:?}", self)
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn free_point(_point: Box<Point>) {}
