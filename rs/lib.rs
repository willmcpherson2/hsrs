#[repr(C)]
#[derive(Debug)]
pub struct Point {
    x: f64,
    y: f64,
}

impl Point {
    #[no_mangle]
    pub extern "C" fn new_point(x: f64, y: f64) -> Box<Point> {
        Box::new(Point { x, y })
    }

    #[no_mangle]
    pub extern "C" fn point_length(&self) -> f64 {
        (self.x * self.x + self.y * self.y).sqrt()
    }

    #[no_mangle]
    pub extern "C" fn print_point(&self) {
        println!("{:?}", self)
    }
}

#[no_mangle]
pub extern "C" fn free_point(_point: Box<Point>) {}
