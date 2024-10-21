use std::time::{SystemTime, Duration};
use std::fmt::Display;
use std::thread::sleep;

impl Display for SystemTime {
}


fn main() {
    loop {
        println!("{time:?}", time = SystemTime::now());
        sleep(Duration::from_millis(60 * 1000));
    }
}
