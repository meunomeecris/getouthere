protocol MoodClient {
    func saveMood(_ daily: DailyMood)
    func loadMood() -> DailyMood
}
