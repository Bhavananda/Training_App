//
//  Model.swift

import SwiftUI


//MARK: Generated Sets: Кандидату, буде потрібно власноруч створити модельку під сети вправ, та вправи окремо. І також, створити згенерований масив сетів вправ, кожен з яких матиме випадковий набір вправ. Для прикладу:

/*
    let setsArray: [SetsModel] = [
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises]),
        SetModel(name: Name, duration: duration, exercisesCount: exercisesCount, exercises: [ArrayOfExercises])

    ]
    , де ArrayOfExercises - буде масивом вправ.
    
 */


struct SetModel: Identifiable {
    var id = UUID()
    let name: String
    let duration: Int
    let exercisesCount: Int
    var exercises: [Exercise]
    
    static var example = SetModel(name: "Generated Set 1", duration: 30, exercisesCount: 10)
    
    init(name: String, duration: Int, exercisesCount: Int) {
            self.name = name
            self.duration = duration
            self.exercisesCount = exercisesCount
            self.exercises = SetModel.generateRandomExercises(count: exercisesCount)
        }
        
        static func generateRandomExercises(count: Int) -> [Exercise] {
            let shuffledExercises = Exercise.exercisesBlock.shuffled()
            let selectedExercises = Array(shuffledExercises.prefix(count))
            return selectedExercises
        }
}

struct Exercise: Identifiable {
    var id = UUID()
    let name: String
    let repeats: Int
    let description: String
    
    static var example = Exercise(name: "Push-Ups", repeats: 15, description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up.")
    
    
    static var exercisesBlock: [Exercise] = [
        Exercise(name: "Push-Ups", repeats: 15, description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up."),
        Exercise(name: "Jumping Jacks", repeats: 30, description: "Stand upright with your legs together and arms at your sides, then jump to spread your legs and lift your arms overhead."),
        Exercise(name: "Squats", repeats: 20, description: "Stand with feet shoulder-width apart, lower your hips back and down as if sitting in a chair, then return to standing."),
        Exercise(name: "Lunges", repeats: 15, description: "Step forward with one leg, lowering your hips until both knees are bent at about a 90-degree angle, then return to standing."),
        Exercise(name: "Plank", repeats: 60, description: "Hold a push-up position with your body in a straight line from shoulders to ankles, engaging your core."),
        Exercise(name: "Burpees", repeats: 12, description: "From a standing position, drop into a squat, kick your feet back to a plank, perform a push-up, return to squat, and jump up."),
        Exercise(name: "High Knees", repeats: 25, description: "Run in place, bringing your knees up towards your chest as high as possible with each step."),
        Exercise(name: "Mountain Climbers", repeats: 20, description: "Start in a plank position, drive one knee toward your chest, then switch legs rapidly."),
        Exercise(name: "Bicycle Crunches", repeats: 20, description: "Lie on your back, lift your legs and shoulders, and perform a cycling motion while bringing opposite elbows to knees."),
        Exercise(name: "Jump Squats", repeats: 15, description: "Perform a squat and then jump explosively, landing softly and immediately going into the next squat."),
        Exercise(name: "Dumbbell Rows", repeats: 12, description: "With a dumbbell in one hand, bend over and pull the weight to your hip, keeping your back straight."),
        Exercise(name: "Tricep Dips", repeats: 15, description: "Using a bench or chair, lower your body by bending your elbows, then push back up to the starting position."),
        Exercise(name: "Leg Raises", repeats: 15, description: "Lie on your back with legs straight, lift them towards the ceiling, then lower them back down without touching the ground."),
        Exercise(name: "Twists", repeats: 20, description: "Sit on the ground with knees bent, lean back slightly and twist your torso, tapping the ground on each side."),
        Exercise(name: "Calf Raises", repeats: 20, description: "Stand with feet shoulder-width apart, lift your heels off the ground, then slowly lower them back down."),
        Exercise(name: "Pull-Ups", repeats: 10, description: "Hang from a pull-up bar with an overhand grip, pull your body up until your chin is above the bar, then lower back down."),
        Exercise(name: "Side Plank", repeats: 30, description: "Lie on your side, prop yourself up on one elbow, and hold your body in a straight line."),
        Exercise(name: "Deadlifts", repeats: 12, description: "With feet hip-width apart, lift a barbell from the ground to hip level, keeping your back straight and core engaged."),
        Exercise(name: "Flutter Kicks", repeats: 30, description: "Lie on your back with legs extended, lift them slightly off the ground, and flutter them in a small, quick motion."),
        Exercise(name: "Box Jumps", repeats: 12, description: "Jump onto a sturdy box or platform, landing softly, then step or jump back down.")
    ]
    
}

struct ExerciseResult: Identifiable {
    var id = UUID()
    let exerciseName: String
    let duration: Int
}


struct App_Setting: Identifiable, Equatable {
    
    var id = UUID()
    let name: String
    let icon: String
    let text: String
}


//-Name
//-Set Duration
//-Exercises Count




//MARK: Sets
//Generated Set 1
//30
//10
//
//Generated Set 2
//22
//12
//
//Generated Set 3
//35
//14
//
//
//Generated Set 4
//25
//17
//
//Generated Set 5
//37
//19
//
//Generated Set 6
//19
//18
//
//Generated Set 7
//32
//18
//
//Generated Set 8
//30
//12
//
//Generated Set 9
//36
//15


//MARK: Set Exercises Model

//Name
//Repeats Count
//Description


//Push-Ups
//Repeats Count: 15
//Description: Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up.

//Jumping Jacks
//Repeats Count: 30
//Description: Stand upright with your legs together and arms at your sides, then jump to spread your legs and lift your arms overhead.
//
//Squats
//Repeats Count: 20
//Description: Stand with feet shoulder-width apart, lower your hips back and down as if sitting in a chair, then return to standing.
//
//Lunges
//Repeats Count: 15 each leg
//Description: Step forward with one leg, lowering your hips until both knees are bent at about a 90-degree angle, then return to standing.
//                                                                                        
//Plank
//Repeats Count: 60 seconds
//Description: Hold a push-up position with your body in a straight line from shoulders to ankles, engaging your core.
//                                                                                        
//Burpees
//Repeats Count: 12
//Description: From a standing position, drop into a squat, kick your feet back to a plank, perform a push-up, return to squat, and jump up.
//                                                                                        
//High Knees
//Repeats Count: 25 each leg
//Description: Run in place, bringing your knees up towards your chest as high as possible with each step.
//                                                                                        
//Mountain Climbers
//Repeats Count: 20 each leg
//Description: Start in a plank position, drive one knee toward your chest, then switch legs rapidly.
//                                                                                        
//Bicycle Crunches
//Repeats Count: 20 each side
//Description: Lie on your back, lift your legs and shoulders, and perform a cycling motion while bringing opposite elbows to knees.
//                                                                                        
//Jump Squats
//Repeats Count: 15
//Description: Perform a squat and then jump explosively, landing softly and immediately going into the next squat.
                                                                                        
//Dumbbell Rows
//Repeats Count: 12 each arm
//Description: With a dumbbell in one hand, bend over and pull the weight to your hip, keeping your back straight.
//                                                                                        
//Tricep Dips
//Repeats Count: 15
//Description: Using a bench or chair, lower your body by bending your elbows, then push back up to the starting position.
//                                                                                        
//Leg Raises
//Repeats Count: 15
//Description: Lie on your back with legs straight, lift them towards the ceiling, then lower them back down without touching the ground.
//                                                                                        
//Twists
//Repeats Count: 20 each side
//Description: Sit on the ground with knees bent, lean back slightly and twist your torso, tapping the ground on each side.
//                                                                                        
//Calf Raises
//Repeats Count: 20
//Description: Stand with feet shoulder-width apart, lift your heels off the ground, then slowly lower them back down.
//                                                                                        
//Pull-Ups
//Repeats Count: 10
//Description: Hang from a pull-up bar with an overhand grip, pull your body up until your chin is above the bar, then lower back down.
//                                                                                        
//Side Plank
//Repeats Count: 30 seconds each side
//Description: Lie on your side, prop yourself up on one elbow, and hold your body in a straight line.
//                                                                                        
//Deadlifts
//Repeats Count: 12
//Description: With feet hip-width apart, lift a barbell from the ground to hip level, keeping your back straight and core engaged.
//                                                                                        
//Flutter Kicks
//Repeats Count: 30 seconds
//Description: Lie on your back with legs extended, lift them slightly off the ground, and flutter them in a small, quick motion.
//                                                                                        
//Box Jumps
//Repeats Count: 12
//Description: Jump onto a sturdy box or platform, landing softly, then step or jump back down.


